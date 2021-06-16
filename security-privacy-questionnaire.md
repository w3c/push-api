# Security and Privacy Questionnaire for the Push API

This document answers the questions raised in the
[Security and Privacy Questionnaire](https://www.w3.org/TR/security-privacy-questionnaire/)
in context of the [Push API](https://w3c.github.io/push-api/).

## 3.1 Does this specification deal with personally-identifiable information?

The Push API issues a subscription that has an endpoint unique to the user. It
persists until the subscription is cleared, either by the developer or by the
user through Clear Site Data features provided by the user agent.

[The specification states](https://w3c.github.io/push-api/#security-and-privacy-considerations)
that endpoints must not be reused to avoid the creation of a persistent
identifier.

## 3.2 Does this specification deal with high-value data?

The developer can specify an arbitrary payload that is to be included with the
push message. Such a payload must be encrypted in accordance with
[draft-ietf-webpush-encryption](https://tools.ietf.org/html/draft-ietf-webpush-encryption)
to make sure that third parties, including the push service (a mandatory
intermediary), cannot gain access to it.

## 3.3 Does this specification introduce new state for an origin that persists across browsing sessions?

Yes, a [push subscription](https://w3c.github.io/push-api/#push-subscription).

## 3.4 Does this specification expose persistent, cross-origin state to the web?

No.

## 3.5 Does this specification expose any other data to an origin that it doesn’t currently have access to?

No.

## 3.6 Does this specification enable new script execution/loading mechanisms?

Yes. The Push API enables developers to wake up their Service Worker remotely,
without depending on the user to have an open window or tab to the origin, or,
in some cases, without depending on the browser to be running at all.

## 3.7 Does this specification allow an origin access to a user’s location?

Potentially, through IP-to-location mechanisms when the Service Worker issues a
fetch.

## 3.8 Does this specification allow an origin access to sensors on a user’s device?

No.

## 3.9 Does this specification allow an origin access to aspects of a user’s local computing environment?

The user agent selects a push service, which might be shared with other
applications on the device. The identity of the push service is available to
the developer through the subscription's endpoint.

## 3.10 Does this specification allow an origin access to other devices?

No.

## 3.11 Does this specification allow an origin some measure of control over a user agent’s native UI?

No.

## 3.12 Does this specification expose temporary identifiers to the web?

No. (See 3.1. and 3.3. for details on the push subscription.)

## 3.13 Does this specification distinguish between behavior in first-party and third-party contexts?

No.

## 3.14 How should this specification work in the context of a user agent’s "incognito" mode?

This is not defined by the specification.

In practice, existing implementations disable the Push API in Private Browsing
mode largely due to a dependency on notifications ("Push Notifications"), which
makes it challenging to provide a clear user experience given the constraints
of Private Browsing.

## 3.15 Does this specification persist data to a user’s local device?

Yes. At most once push subscription per Service Worker, which includes an
endpoint, a P-256 EC key pair and a 16-byte authentication secret. User agents
may need to store additional data depending on the push service they interact
with.

The lifetime of the subscription is tied to the lifetime of the Service Worker,
which will be removed by Clear Site Data features available in the user agent.

## 3.16 Does this specification have a "Security Considerations" and "Privacy Considerations" section?

Yes.

## 3.17 Does this specification allow downgrading default security characteristics?

No.
