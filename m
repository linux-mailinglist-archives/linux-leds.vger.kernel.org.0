Return-Path: <linux-leds+bounces-7628-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iF1iOqqd0mneZAcAu9opvQ
	(envelope-from <linux-leds+bounces-7628-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 05 Apr 2026 19:36:42 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8564139F32F
	for <lists+linux-leds@lfdr.de>; Sun, 05 Apr 2026 19:36:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F41B0300130E
	for <lists+linux-leds@lfdr.de>; Sun,  5 Apr 2026 17:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD1D2C1595;
	Sun,  5 Apr 2026 17:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DkIFgdIh"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7787128AB0B;
	Sun,  5 Apr 2026 17:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775410598; cv=none; b=F2eUr1V+Y93v37Bk6VT8XuANG80BrJLemsgRvgCASsV2Cp2trqwuKBgbUvgKeJJf12T+5hqZQwdUPpzI3nvIXX0Z1TxnNobQp5Uf/UiF/hYGVDYWKXjpnS6gyDgfa929WegmMrDD2rVTPPqrTQxPaJvDfyFjmfeuLu5xKl4HH4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775410598; c=relaxed/simple;
	bh=ZpadFe1RBUAmpGQkjkYP0sG88PfUKH1EwDULVQ2W8pg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dmbgy6FzkItkZQ7yY7/oGSbhGxT2sURhNOegrnK2PUx9V1qKrQS8i0yMrnJ03+WTgIJPrZJUtQlTZDMZMQJJWgewHPObtUWQd0wQer6QerXZjR30vCQWhlRzp/1CO/7+h2qcHiisDrm2xPTF/aLwxyLCaLAhxUDuuzGN1zjpsQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DkIFgdIh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03D6BC116C6;
	Sun,  5 Apr 2026 17:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775410598;
	bh=ZpadFe1RBUAmpGQkjkYP0sG88PfUKH1EwDULVQ2W8pg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=DkIFgdIhHtO549nrAG9jrxyG8Ckd/fzfmVkNAww9KepAUZ08+DKu8uQa+iYEA/MfH
	 18mbvPC8sAwQT93038dnBV6W/Bg2wYhaxSJd3p4BoDJnE6rxanmErTTYDo3g85jjeN
	 2mP/bYkxeJDIwNJCaZvT60JQpxLe1/av5ITuGEH1pGOTt/P1lIMDse7jfRPcyXKqAX
	 z20a2J19ujUsIANHShh2t8s1Tu+VklHMiYNbm9llrh1ztd0eMb5BgWHnGMFbiwOCG0
	 FmFawirugSzZW7B/PtIVQqOdr2RoeVWgd5Os8WY/d09IqiylSfNa+RZ2dpbOIvz75D
	 WQQzPlMyQ3XDw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E959DE9D814;
	Sun,  5 Apr 2026 17:36:37 +0000 (UTC)
From: Markus Probst via B4 Relay <devnull+markus.probst.posteo.de@kernel.org>
Subject: [PATCH v6 0/2] Introduce Synology Microp driver
Date: Sun, 05 Apr 2026 19:36:27 +0200
Message-Id: <20260405-synology_microp_initial-v6-0-08fde474b6c9@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJud0mkC/4XP32rDIBgF8FcpXs/if2Ou9h5jFKOfrdDGTlNZK
 X33uXSwrBB2eYTz83w3VCBHKKjf3FCGGktMYwvqZYPcwY57wNG3jBhhinCicLmO6Zj2190pupz
 OuzjGKdojJkF76/SghVGotc8ZQvyc5bf3R87wcWkfTI/HX7/fNF1SRjXOlzLt2iQPFQNI0VEwp
 JOurxwtJ/1UKBWPyhF8wdZIE7RjQQfTVzo3BlsAu3Q6xanfVL0lODuFvgcdYplSvs6XVzov+vf
 ISjHBwYUAHpQQnXs9pzJB2nqYzcqWTrfusOYY3hmjeODUyWeHLxzK1x3eHOuVdUJxywh9dsTCY
 WTdEc0hgnHvh447K54duXTMuiObw7QbOjL4IM2fPff7/QvXPtyMbwIAAA==
X-Change-ID: 20260306-synology_microp_initial-0f7dac7b7496
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Markus Probst <markus.probst@posteo.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4512;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=ZpadFe1RBUAmpGQkjkYP0sG88PfUKH1EwDULVQ2W8pg=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBp0p2iiqDvp4Z4mFyTjdzh/Ho0sUfzo1JeyMMq9
 YZQ1StbUBOJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCadKdohsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQNHYf+OetQ9JozxAAmvxYifkeeVBXmgE7yhC/ymyrYc/nXJa
 8SrlZFsj7KAvcKGcSkhMKncVY+GWszqpD7ooNFVaLDG/h5r1lBsiezMhXSF5zvQVbzueRVFDJa9
 ktwx6y02OM+XqVXFk55BQXL4IRq0h62VL6VsgikebOtvCyhkjI4XWEnxbFxq2woqbvzbmfTukFH
 J/Gf34vVRZ61B/tjdDm5y1KVc86IM6sIdZvL7ZzcktixLUZVr9SxIEJ7F7Sqyn9kSLdvWmi0/Sn
 6uCutaT72DHGZRWpB8PU4hZI+EAA2OR8oXxaVaJkBUfEJ3bLdGw9HaavaxQ8DWrIMI/KwFxpld9
 IMlbc87JNJ2yb/Auur7teHUqtyYlgJ5Hk8ETQW/d0RSqoCmQ+UmJJdxItz1HHPiPahXZ7a6/fAy
 LSSCWp552+Dy+ABu4C+HTMXmqUU8m+XD9nCy1m1QXo5ufbwHfLJvkCYl5cvVAgTqWIJHKBDI5ZA
 WurrI6R+Y3KEM+ngBW10izvfsEY03p6+C+OTTE1Wmhe4QRr/ws+OP8z1axgkmPL8l3BiFDRthJD
 xW6xytQRmatgPIXpTM4ygR46f2JHQ/uXdnpqT5FsqZj7aBxZMCf3NKyOvAHc9f6qfPaWU3dxt3g
 elVl0JacAZ3VimNCzTYnN6RfiJC5mk7k2QN98yOUthcc5dUa6VU8=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
X-Endpoint-Received: by B4 Relay for markus.probst@posteo.de/default with
 auth_id=680
X-Original-From: Markus Probst <markus.probst@posteo.de>
Reply-To: markus.probst@posteo.de
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7628-lists,linux-leds=lfdr.de,markus.probst.posteo.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[markus.probst@posteo.de]
X-Rspamd-Queue-Id: 8564139F32F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Synology uses a microcontroller in their NAS devices connected to a
serial port to control certain LEDs, fan speeds, a beeper, to handle
proper shutdown and restart, buttons and fan failures.

This patch series depends on the rust led abstraction [1] and the rust
serdev abstraction [2].

This is only a initial version of the driver able to control LEDs.
The following rust abstractions would be required, to implement the
remaining features:
- hwmon (include/linux/hwmon.h)
- input (include/linux/input.h)
- sysoff handler + hardware protection shutdown (include/linux/reboot.h)

[1] https://lore.kernel.org/rust-for-linux/20260329-rust_leds-v13-0-21a599c5b2d1@posteo.de/
[2] https://lore.kernel.org/rust-for-linux/20260313-rust_serdev-v3-0-c9a3af214f7f@posteo.de/

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
Changes in v6:
- moved devicetree bindings patch at the end of the set
- remove several patches
- move of id table from model.rs to synology_microp.rs
- remove the model! macro
- use if blocks in devicetree schema to narrow down the
  fan-failure-gpios property
- add multiple devicetree examples to test if blocks
- Link to v5: https://lore.kernel.org/r/20260329-synology_microp_initial-v5-0-27cb80bdf591@posteo.de

Changes in v5:
- add esata led support
- use different compatible for each model
- add visibility modifier to of_device_table macro
- fix match data missing when using PRP0001
- Link to v4: https://lore.kernel.org/r/20260320-synology_microp_initial-v4-0-0423ddb83ca4@posteo.de

Changes in v4:
- convert to monolithic driver and moved it into drivers/platform
- removed mfd rust abstraction
- moved dt-bindings to embedded-controller
- Link to v3: https://lore.kernel.org/r/20260313-synology_microp_initial-v3-0-ad6ac463a201@posteo.de

Changes in v3:
- remove `default n` from Kconfig entry, as n is the default already.
- select RUST_SERIAL_DEV_BUS_ABSTRACTIONS in Kconfig
- add mfd rust abstraction
- split core and led parts into their own driver. It should now be considered a
  MFD device.
- split led part of dt binding into its own file
- Link to v2: https://lore.kernel.org/r/20260308-synology_microp_initial-v2-0-9389963f31c5@posteo.de

Changes in v2:
- fix missing tabs in MAINTAINERS file
- remove word binding from patch subject
- add missing signed-off-by
- add missing help entry in Kconfig
- add missing spdx license headers
- remove no-check{,-cpu}-fan properties from the dt-bindings and replace
  them with the check_fan module parameter
- use patternProperties for leds in dt-bindings
- license dt-binding as GPL-2.0-only OR BSD-2-Clause
- move driver from staging tree into mfd tree and mark it as work in
  progress inside Kconfig
- only register alert and usb led if fwnode is present
- Link to v1: https://lore.kernel.org/r/20260306-synology_microp_initial-v1-0-fcffede6448c@posteo.de

---
Markus Probst (2):
      platform: Add initial synology microp driver
      dt-bindings: embedded-controller: Add synology microp devices

 .../synology,ds923p-microp.yaml                    | 112 +++++++++
 MAINTAINERS                                        |   6 +
 drivers/platform/Kconfig                           |   2 +
 drivers/platform/Makefile                          |   1 +
 drivers/platform/synology_microp/Kconfig           |  13 +
 drivers/platform/synology_microp/Makefile          |   3 +
 drivers/platform/synology_microp/TODO              |   7 +
 drivers/platform/synology_microp/command.rs        |  55 ++++
 drivers/platform/synology_microp/led.rs            | 276 +++++++++++++++++++++
 drivers/platform/synology_microp/model.rs          |  49 ++++
 .../platform/synology_microp/synology_microp.rs    | 109 ++++++++
 11 files changed, 633 insertions(+)
---
base-commit: b6c7d19951061de1be08fb8f5714e630b24bcc1c
change-id: 20260306-synology_microp_initial-0f7dac7b7496
prerequisite-change-id: 20251217-rust_serdev-ee5481e9085c:v3
prerequisite-patch-id: 52b17274481cc770c257d8f95335293eca32a2c5
prerequisite-patch-id: eec47e5051640d08bcd34a9670b98804449cad52
prerequisite-patch-id: f24b68c71c3f69371e8ac0251efca0a023b31cc4
prerequisite-patch-id: 3dfc1f7e5ecd3e0dd65d676aeb16f55260847b25
prerequisite-change-id: 20251114-rust_leds-a959f7c2f7f9:v13
prerequisite-patch-id: 818700f22dcb9676157c985f82762d7c607b861e
prerequisite-patch-id: b15ffa7d95d9260151bfb116b259c4473f721c82
prerequisite-patch-id: 8c47e0d107530f577a1be0b79f8ee791f95d3cbe



