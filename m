Return-Path: <linux-leds+bounces-8767-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8vHGEthxQmqj7QkAu9opvQ
	(envelope-from <linux-leds+bounces-8767-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 15:23:36 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 096296DB249
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 15:23:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=posteo.de header.s=2017 header.b=mgRMlr4r;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8767-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8767-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=posteo.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A1A04303330B
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 13:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C90D04071DA;
	Mon, 29 Jun 2026 13:10:31 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B154A407598
	for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2026 13:10:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782738631; cv=none; b=S7WnZgfulEBTwUf9KYe/MjUJ6bufn/J+gZqCHOKSNjvtMCpAd4oFq8SM/eTmKKm3vhCB8fRssJ/Aa4dx+ZPVHtHHUdP+yWLJIOkuddPbCd3DM2c5W4lYYjRMV32viNFFOxekIw9Op4F0Y2cVMKdRenEItBiHPmqlqDQtiFJD558=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782738631; c=relaxed/simple;
	bh=4blwwAnxbVQBrEw8zfOquKxYLLRib4r8C8FSOZmT3XM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gbXg0bSLpitUFGvFcXW5rLFvz+mULtXjx6YDhZPY6E8I4/4SFEZpsqwIxZc0TKJXvx5oYY5+eYgun8I6CTS1bP/d+ybAbX08M1fYceCLpVglML7ZA6qNukAS60IGyep4mZdflPYL1WJJDBy5CxhJrq/od5n0v3+zvv8WPMzydkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=mgRMlr4r; arc=none smtp.client-ip=185.67.36.65
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 40D3A240027
	for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2026 15:10:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1782738627; bh=PDnBe4/yoUYfy9dgLe+zaNJjxFTg5Nezp/0zA95aTLQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:To:Cc:Autocrypt:OpenPGP:From;
	b=mgRMlr4rSRZ8e3rbaM20wuzPa1m0riwjnYxvsRCDU2JBClHKycywjAupkNUa+LsN1
	 ROYB78kJYfdc9vF6T0U58Oz0g9b8E2eGCNeKNLZ1DjSH7bm0K6wtoQenQoiYvsSnMs
	 i2WStxTURfbrQzItzZ2V7MQU5GDjeXOB2StL/uzGUSb+VzOEg461wH78zNr0jnMEBJ
	 EsEtKt1xxnsMQoydHB5tDo7UJFBY0qebKeb4y8SwhfejrUGlFGhG6ZbuAB8JVzSWjh
	 8fPz3v6hdGyGcr2KRYyosGvoU90b77MXp7ohcNJHQ3adX7E6dAlSJoFWyQBhzyzjsZ
	 qQzifwRbC4W7g==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4gpmq35VXwz6tsf;
	Mon, 29 Jun 2026 15:10:23 +0200 (CEST)
From: Markus Probst <markus.probst@posteo.de>
Subject: [PATCH v21 0/3] rust: leds: add led classdev abstractions
Date: Mon, 29 Jun 2026 13:10:25 +0000
Message-Id: <20260629-rust_leds-v21-0-4f0f19579db5@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XTy07lMAwA0F+56pqiOInzYDX/MRqhPJyhElCmL
 RUI8e+4F6Emk02lRDl24tofw0rLROtwd/kYFtqndZqfeSHh5jKkh/D8l8Yp88YghUQA0OPyum7
 3j5TXMXj0xSZZbPEDn39ZqExv12C///D6YVq3eXm/xt7dsfsTBasouxvFmH3QUBQiKvfrZV43m
 m8zDUeU3dfS19KzdCYB5gBeGPW/BPFDjQBhagqCLYkAaLRzuvjOwmn501hgiw4zJBdJitRZWVv
 bWMm25IjgNNhosbPqtEo2zwXFVkJA7xNGmaGz+rRatnk1W110BEuYEUxnsbZtXmTrLXkbpaUY+
 zub06KAxprDFn5JyZRT7utsK6tEYy3bJIx3SSvjSHbW1bbNe+0qYUHIGBCs6Kw/LVe6sUdfycC
 W/zEF6vpKVn1l2lrJo6+K9ipEvlLUpbaf30Oy0L9XHrTte1KGGFYa0/z0NG13l93ecq8l4MOfX
 /PTvzydAwAA
X-Change-ID: 20251114-rust_leds-a959f7c2f7f9
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Ira Weiny <iweiny@kernel.org>, Boqun Feng <boqun@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
 Markus Probst <markus.probst@posteo.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=5628;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=4blwwAnxbVQBrEw8zfOquKxYLLRib4r8C8FSOZmT3XM=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBqQm6+K3g378KO1/+uiK5HHFLVboBoC6/ulprfA
 40sUQv5LMWJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCakJuvhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQNHYf+OetQ9IShQ/+JZR0byiZ9AkYea++XOkbwUK/9CTUN5C
 p0IzT9do+cVtM7epF93BWyVRQD1b3hF2AQulHP4UkK8XPPCcf7LcBTZIUR2f8VY9mxfr8/rWt4v
 MgTYL5lmVWYf6zN8Oym980DOqAZ6E+z933mr/I9zbysIjwbN5UjhfKGAx3K+tBPlas2CVnAcPb4
 oOJn2KccKb3dkPJT9ajqCz6PnmxtHensnHaTPCb6yIo8yoHFxU8qqYvJUBUzzorU5bZ5R3EOvMH
 7FmppwbUklsF0vqonMVNzd7QGqYBp2Q12hVqc09PQfkROsWU5JRjx45P9uyMdEDg1aAPSzEAgr1
 oN7u+yLGkm6E3IaSQzwwlRSFr5Af7SAvIJUY+q96ShSa+TCTUOlt+KP6XYr0aWioOFNnMNj8wr+
 Fc/bB0TmmELl1RrA+4gOX/JJHYR7E0GdEOcnV70lqIZgfn5IO2ugdYMiO9hOqA5kl4rKla7NB2p
 cLfyHaH0QqZW4SyEfu+5FmvD4S0YrzjfKsleqLUCEtROMpH2jC3J4yLe5BdgVa+fasMNjzqeWZ7
 VCbbUETdvCoWMJWl5f7yOeitrLGlMbCa4fbzv7My7uIvvRohR85FqD4pxd6LimEtcMivOyUheIt
 SvacQCeDAhNyvpCbsFwDwMKqoOQeuFzvY59n0F9Pwi4GPmT7OeAk=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
  keydata=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
  aBeNN4ijKZchBXHPgVx+YtWRHfcm4l8=
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[posteo.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8767-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,intel.com,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev];
	FORGED_SENDER(0.00)[markus.probst@posteo.de,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:gregkh@linuxfoundation.org,m:david.m.ertman@intel.com,m:leon@kernel.org,m:ojeda@kernel.org,m:alex.gaynor@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:rafael@kernel.org,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:boqun@kernel.org,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:iweiny@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:markus.probst@posteo.de,m:alexgaynor@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[posteo.de:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.probst@posteo.de,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,posteo.de:dkim,posteo.de:email,posteo.de:mid,posteo.de:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 096296DB249

This patch series has previously been contained in
https://lore.kernel.org/rust-for-linux/20251008181027.662616-1-markus.probst@posteo.de/T/#t
which added a rust written led driver for a microcontroller via i2c.

As the reading and writing to the i2c client via the register!
macro has not been implemented yet [1], the patch series will only
contain the additional abstractions required.

This series depends on [1].

[1] https://lore.kernel.org/rust-for-linux/20260525202921.124698-1-dakr@kernel.org/

The following changes were made:
* add basic led classdev abstractions to register and unregister leds

* add basic led classdev abstractions to register and unregister
  multicolor leds

Changes since v20:
* resolve Sashiko regressions:
  * fix typo
  * fix fwnode refcount decremented too early

Changes since v19:
* rebase on v7.2-rc1:
  * Add `max_intensity` to `MultiColorSubLed`
* use safer `KBox::pin_slice` instead of `KVec`
  (len might not equal capacity)
* explicitly call `FwNode::dec_ref` instead of dropping a reconstructed
  `ARef<FwNode>`.
* remove direct access to `intensity` and `brightness` fields,
  which may get mutated concurrently by the C side
* fix safety comments pointing to functions from previous revisions

Changes since v18:
* add inlines
* fix invalid documentation
* improve led color duplicate checking

Changes since v17:
* use lifetimes instead of Devres

Changes since v16:
* use for loops for duplicate checking

Changes since v15:
* fix issues reported by Sashiko bot:
  * fix returning error not possible on `brightness_get` callback

Changes since v14:
* fix issues reported by Sashiko bot:
  * add missing inlines
  * add missing Sync trait bound
  * fix vertical import layout for public export of private types
  * fix potential memory leak, if a multicolor led device with over
    `u32::MAX` subleds is registered
* remove default_trigger option
* fix missing CAST doc

Changes since v13:
* rebased onto v7.1-rc1

Changes since v12:
* add `led::DeviceBuilder::name()` and `DeviceBuilderState'
* add `led::Color::as_c_str`

Changes since v11:
* use `led::DeviceBuilder` instead of `led::InitData`
* use static_assert instead of const { assert!(...) }
* restructured patches to avoid moving `led::Device` from
  rust/kernel/led.rs to rust/kernel/led/normal.rs in the 2. patch

Changes since v10:
* allow in-place initialization of `LedOps`
* run rustfmt for code inside `try_pin_init!`

Changes since v9:
* add missing periods in documentation
* duplicate `led::Device` and `led::Adapter` instead of using a complex
  trait
* fix imports not using prelude
* adapt to CStr change
* documented `led::Color::Multi` and `led::Color::Rgb`

Changes since v8:
* accept `Option<ARef<Fwnode>>` in `led::InitData::fwnode()`
* make functions in `MultiColorSubLed` const
* drop the "rust: Add trait to convert a device reference to a bus
  device reference" patch, as it has been picked into driver-core

Changes since v7:
* adjusted import style
* added classdev parameter to callback functions in `LedOps`
* implement `led::Color`
* extend `led::InitData` with
  - initial_brightness
  - default_trigger
  - default_color
* split generic and normal led classdev abstractions up (see patch 3/4)
* add multicolor led class device abstractions (see patch 4/4)
* added MAINTAINERS entry

Changes since v6:
* fixed typos
* improved documentation

Changes since v5:
* rename `IntoBusDevice` trait into `AsBusDevice`
* fix documentation about `LedOps::BLOCKING`
* removed dependency on i2c bindings
* added `AsBusDevice` implementation for `platform::Device`
* removed `device::Device` fallback implementation
* document that `AsBusDevice` must not be used by drivers and is
  intended for bus and class device abstractions only.

Changes since v4:
* add abstraction to convert a device reference to a bus device
  reference
* require the bus device as parent device and provide it in class device
  callbacks
* remove Pin<Vec<_>> abstraction (as not relevant for the led
  abstractions)
* fixed formatting in `led::Device::new`
* fixed `LedOps::BLOCKING` did the inverse effect

Changes since v3:
* fixed kunit tests failing because of example in documentation

Changes since v2:
* return `Devres` on `led::Device` creation
* replace KBox<T> with T in struct definition
* increment and decrement reference-count of fwnode
* make a device parent mandatory for led classdev creation
* rename `led::Handler` to `led::LedOps`
* add optional `brightness_get` function to `led::LedOps`
* use `#[vtable]` instead of `const BLINK: bool`
* use `Opaque::cast_from` instead of casting a pointer
* improve documentation
* improve support for older rust versions
* use `&Device<Bound>` for parent

Changes since v1:
* fixed typos noticed by Onur Özkan

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
Markus Probst (3):
      rust: leds: add basic led classdev abstractions
      rust: leds: add Mode trait
      rust: leds: add multicolor classdev abstractions

 MAINTAINERS                     |   8 +
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/led.rs              | 339 +++++++++++++++++++++++++++++
 rust/kernel/led/multicolor.rs   | 460 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/led/normal.rs       | 238 +++++++++++++++++++++
 rust/kernel/lib.rs              |   1 +
 6 files changed, 1047 insertions(+)
---
base-commit: 728e68a889bcf257b1e67298b12c360e5c3a13e0
change-id: 20251114-rust_leds-a959f7c2f7f9


