Return-Path: <linux-leds+bounces-7912-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOjNNqJO8mk4pgEAu9opvQ
	(envelope-from <linux-leds+bounces-7912-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 20:32:02 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 475F549918D
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 20:32:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8D5B3041A81
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 18:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68F7D41C318;
	Wed, 29 Apr 2026 18:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U80ddX/M"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7397541B37C;
	Wed, 29 Apr 2026 18:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777487458; cv=none; b=qrq7S9KJ3ctM3A5HUhfmGJgnQNke6jFJuvkp2KqDarxbXthqHa0wDZKUkXhMdjRcmhJAYX+h24la7/cXh9Ed/EXCQQLW0mrXNZnE3h0yW0XBbkpEWD6CReUAXyo5G3Nmos8F9ILhSrERNJwUU6uMBhPaGo9jYct7/OOayZHf0qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777487458; c=relaxed/simple;
	bh=UOexMLzR7IWoJ206RWJku0oqf0p9l6v6jnfXbZZ9Igk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SJqe7RGVe/cUsdIibIrJ+Qc0d22hEZhHjDcQHJPQ0iMj7du7RghknWzCBwhXlxFh61rGzpEGClxRX2ky8IrkayuzkxJ690IfWPWSYmbRseTJjuVAVRV4i+lvsJwSC8NESKPQdfDyb+zAZdhiNEQyCr/yUS8yDGJGmwViuDvi8vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U80ddX/M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2F98C2BCC4;
	Wed, 29 Apr 2026 18:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777487458;
	bh=UOexMLzR7IWoJ206RWJku0oqf0p9l6v6jnfXbZZ9Igk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=U80ddX/MFzPj5atQnLsni7VC+rJX0oPBwUK85ZLL7XVISmwnJNB3cueqtcZr61JkO
	 QwdJrgu5Y/BTlOlrUBDnjJG4Xj7MTj3JMabmMERGf/E8fkouKkxLVipSzH3GxIG2Rt
	 Ksxg96f4/4y5JzJ8J/SRtofSS5a95J7Z++8SMXb9xB+vJ7/H502tLNGg2WngPsc0Yn
	 R8tQMB6gYymrAmjalVGEqty1+h/M2PwOT07TIWPJnEI3ju1OtDiY+XL8eusYyL/DBc
	 LDjaLzHZtkDpTfVv8kfoD1z46MPWDoODVMTwYlMNASRuGdJGKtEUrxIRaP2uvxSSbn
	 fLv+koSp51SoA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE145CCFA13;
	Wed, 29 Apr 2026 18:30:57 +0000 (UTC)
From: Markus Probst via B4 Relay <devnull+markus.probst.posteo.de@kernel.org>
Subject: [PATCH v12 0/2] Introduce Synology Microp driver
Date: Wed, 29 Apr 2026 20:30:40 +0200
Message-Id: <20260429-synology_microp_initial-v12-0-40a05033c620@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFFO8mkC/4XS3W7jIBAF4FeJfL1EDP/kqu+xWkUYhhQ1iVNwr
 UZV3r3YkXYtp85egnQ+hgNfTcGcsDS7zVeTcUgldee6APZr0/hXdz4gSaFuNIwyRTlVpFzP3bE
 7XPen5HN32adz6pM7Ehp1cF63WljV1PQlY0yfE/37z32d8f2jntDfN5sTluKmA3abiRdMMwaUs
 i0DwY0CAiS4t/zyhvmMx22XD6O8kgMpx5wwwvyc+3ufKSaBgSb5o/T72kHAgSBKYQAtNdLvBv1
 TBEDcI0cMhTgrbdSeRR3tbgA5JlpXkPjudEr9bjPoLZDsoRkLeE2l7/J1qnqAqYH/ljoAoST6G
 DGgqlfzL5eu9NhtA07mwOaOWXdYdSw31ioeOXi5dPjMAb7u8Oq4oJwXijtGYemImcPouiOqU9+
 Nh9Aa7p1YOnLu2HVHVodp3xrahijtwzzqnyOoXHfUOI+JAYUWrfJ26eiZA7Du6LFnxx21AnWta
 OmYmfOsH1MdbYVyFpgQj/eyc+fJe9nqCGck59FopHrpAJ1D4slHrP0QNJIFFjm27mEigLmkn0j
 jn7Ye2iCdqlaYS7fb7RtXbLlxlAQAAA==
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
 rust-for-linux@vger.kernel.org, Markus Probst <markus.probst@posteo.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10659;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=UOexMLzR7IWoJ206RWJku0oqf0p9l6v6jnfXbZZ9Igk=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBp8k5faCQOv09MTc9vrL+MMU3j2usmfTA2sJa9y
 5Q2mlEjGrSJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCafJOXxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQNHYf+OetQ9LtEg//TQsSfVCJp/KIFEdurfLSDNOCl2GI7er
 zBbyfZz3tf4Rvlh6vuzcWUXz0GxKkERSI+km28GoJF2VI6tizevmv8EUQ+6hQvSAGvCLG4yI5W/
 mJYb+xggST8p5b4IfeXXznAog3XHjUZKrayWyHNXjOzrWya8/4QxFo3eLCUxnwI3gcKTtYOVz05
 jlCN4CiHbgbhSwJlbtYSZpbk/3N+njLbWmyVAmYUMqHOvlyDIoB1Y0hXw0/EgRxfqRcVe4Yrmtj
 +vIGGR1dMeYokeb/3UJQwdL6m+YyP9qUDTXT8olO0Ya1R5GBBYJNIgHiiRhCEjeWJ29oqd3nkTS
 bf/9eBK2VpnnTioaMlPOIo3g/Dk8kZGyCXRxo7lrp7VqOA1SDBtS04C/xPfqkY4B6BBSFNWJJXe
 pZo1uMMiPWz/MVLX2jWFCPYEomiiySDRAu2+MI3aCUOt8FrcbrsffC//IyWI02tlrBXaCEBGJbs
 TWYBq4jUr5RSsRxmrxwZi/4H0cGEgYnp3FiORqxs7ZgLXVBBi/rzlpe/xk/M+eO5kOv3EQECV2Y
 T5YYlfgRsK6u40RuwdittC7FzqV0mQncKb/LmXJbwd1RAn98MaO6CA+GaDOjEEJHBLDa4943Wmq
 yFjNCXoVYeZNRRt7HOERwiNcx+ljcsEK4A8qIere0mlBzBWeZOI8=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
X-Endpoint-Received: by B4 Relay for markus.probst@posteo.de/default with
 auth_id=680
X-Original-From: Markus Probst <markus.probst@posteo.de>
Reply-To: markus.probst@posteo.de
X-Rspamd-Queue-Id: 475F549918D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7912-lists,linux-leds=lfdr.de,markus.probst.posteo.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-leds@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	HAS_REPLYTO(0.00)[markus.probst@posteo.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[model.rs:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,posteo.de:email,posteo.de:replyto,posteo.de:mid,msgid.link:url]

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
- sysoff handler (include/linux/reboot.h)

[1] https://lore.kernel.org/rust-for-linux/20260427-rust_leds-v14-0-4f4b17e5d516@posteo.de/
[2] https://lore.kernel.org/rust-for-linux/20260427-rust_serdev-v6-0-173798d5e1a3@posteo.de/

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
Changes in v12:
- adapted to driver-lifetime patch series. The driver can't take
  advantage of it, until class devices like led also make use of it.
- Link to v11: https://patch.msgid.link/20260427-synology_microp_initial-v11-0-9c1bd5a6f3ed@posteo.de

Changes in v11:
- rebased on top of 7.1-rc1
- add "synology" as devicename to led, like it is done in existing dts
  files in the kernel
- fix color for led being orange instead of amber. I personally can't
  clearly tell them apart, but apparently its amber.
- replaced MCU with EC in Kconfig help
- Link to v10: https://patch.msgid.link/20260424-synology_microp_initial-v10-0-e852d2f3eba1@posteo.de

Changes in v10:
- resolved issues reported by Sashiko Bot:
  - removed unneeded include from device tree
  - fix typo in of device table
  - fix blink not set to false, if delay_off or delay_on is 0
- Link to v9: https://patch.msgid.link/20260423-synology_microp_initial-v9-0-4a8533f87e07@posteo.de

Changes in v9:
- separate fallback and front compatibles in dt schema
- remove front compatibles from of id table, if all functionality is
  by covered by the fallback
- remove TODO file
- add platform-driver-x86@vger.kernel.org to Maintainers file entry
- use `Delta` type in `BLINK_DELAY` const
- Link to v8: https://patch.msgid.link/20260420-synology_microp_initial-v8-0-7946a9124491@posteo.de

Changes in v8:
- removed unnecessary Copy and Clone derive
- added `BLINK_DELAY` constant
- added compatible id fallbacks
- moved dt schema patch before the driver
- added ds411p
- Link to v7: https://lore.kernel.org/r/20260411-synology_microp_initial-v7-0-9a3a094e763a@posteo.de

Changes in v7:
- remove list of compatible ids from commit msg
- explain what makes the different models not compatible in the commit msg
- remove unnecessary examples
- Link to v6: https://lore.kernel.org/r/20260405-synology_microp_initial-v6-0-08fde474b6c9@posteo.de

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
      dt-bindings: embedded-controller: Add synology microp devices
      platform: Add initial synology microp driver

 .../synology,ds918p-microp.yaml                    | 100 +++++++
 MAINTAINERS                                        |   7 +
 drivers/platform/Kconfig                           |   2 +
 drivers/platform/Makefile                          |   1 +
 drivers/platform/synology_microp/Kconfig           |  13 +
 drivers/platform/synology_microp/Makefile          |   3 +
 drivers/platform/synology_microp/command.rs        |  54 ++++
 drivers/platform/synology_microp/led.rs            | 287 +++++++++++++++++++++
 drivers/platform/synology_microp/model.rs          |  49 ++++
 .../platform/synology_microp/synology_microp.rs    |  90 +++++++
 10 files changed, 606 insertions(+)
---
base-commit: 5e9b7d093f3f77cb0af4409559e3d139babfb443
change-id: 20260306-synology_microp_initial-0f7dac7b7496
prerequisite-message-id: 20260427221002.2143861-1-dakr@kernel.org
prerequisite-patch-id: 925690ac15ddd64777b2da34b343d2547bbf79e8
prerequisite-patch-id: 67318671a5eed5fb4ad23a450f1cf0e442bf8ca2
prerequisite-message-id: 20260427221155.2144848-1-dakr@kernel.org
prerequisite-patch-id: 87127047dbf7d948ae98f1ff0f4a782214a516e2
prerequisite-patch-id: 7664165039fb510368a721edfe60f5b67449b7b6
prerequisite-patch-id: 1e8c97720bab512d8646409c129edd6047164c4c
prerequisite-patch-id: f0fdd1e9912f31a3945f1c0f227dcb64cf71885d
prerequisite-patch-id: be515f7e13f7800eaadb3ed85dec6a9ddb733828
prerequisite-patch-id: 3a3c7749e017d9335f58497404d1350e96caf471
prerequisite-patch-id: 3526c9154f581497a11465b936d83ef61a875454
prerequisite-patch-id: 65d8c757b52475c2acc7d22ddc92cd3f0152b55d
prerequisite-patch-id: 4bd31f1414d5248dc080884caadf5f21684a8427
prerequisite-patch-id: 7beadbb0da3e589ed86d12f512d1c83427dd82b4
prerequisite-patch-id: f04f5427c592cb078c08ee071b965ef6fd4a9a48
prerequisite-patch-id: 64c0098c3d2420f82c89f44fccd3eed459557bfc
prerequisite-patch-id: 3294340ecd964b8e3e87e5a787ff1ffa28e0b698
prerequisite-patch-id: b2c14d06f068dc6a52814fc55d1188737dc29861
prerequisite-patch-id: c7fd96983b606bc42cc5b003022b8fa2bb1c0c34
prerequisite-patch-id: 8e9f4c2d5521fb6cdc5bed2d6661f4bbed5eb63d
prerequisite-patch-id: d868f7925ee9dfe44c5ddf50f4deb50263ff203f
prerequisite-patch-id: 5677248690560ec45e512a8cdbbf8aecfad62d77
prerequisite-patch-id: 5d9674da330ee9d0f4c91edb8acc20727ba1cd9c
prerequisite-patch-id: d5f29453bfd2e3354fb96b57d7a55521bedb2b0b
prerequisite-patch-id: 9d6f96e26fe651304e950766d6bc2006dd33e86a
prerequisite-patch-id: c7a73c58c6d4ca8556d29ce651ad78cc647f6f31
prerequisite-patch-id: c5f35030637e78ab6f5fa489172f1506493fbae1
prerequisite-patch-id: aad19e48d4fa45734050bba927a5b72d6def9673
prerequisite-change-id: 20251217-rust_serdev-ee5481e9085c:v7
prerequisite-patch-id: 43476e21c086dc8a8b4156632fb3ff7b9d04ee6e
prerequisite-patch-id: ced11cc751d4e7f89cd93b6864b25284881a505d
prerequisite-patch-id: 8e0b8bf8f1b3ac82f85ed20de394a5046d73f18e
prerequisite-patch-id: 43c95bf2b1edace10b2b1b3d7fb8c841d9de3bb5
prerequisite-patch-id: 684a9540a4cea7fca2ace91e22a80e72447ac49e
prerequisite-patch-id: 321d0ba076ad73063cbf101a377c89763381850f
prerequisite-patch-id: 1b9708867520d311894f4f3fb4efac52a2101f02
prerequisite-patch-id: 2679d72b2da0b4d26d11d3b580b1bc0ebc0427d6
prerequisite-patch-id: 925690ac15ddd64777b2da34b343d2547bbf79e8
prerequisite-patch-id: 67318671a5eed5fb4ad23a450f1cf0e442bf8ca2
prerequisite-patch-id: 87127047dbf7d948ae98f1ff0f4a782214a516e2
prerequisite-patch-id: 7664165039fb510368a721edfe60f5b67449b7b6
prerequisite-patch-id: 1e8c97720bab512d8646409c129edd6047164c4c
prerequisite-patch-id: f0fdd1e9912f31a3945f1c0f227dcb64cf71885d
prerequisite-patch-id: be515f7e13f7800eaadb3ed85dec6a9ddb733828
prerequisite-patch-id: 3a3c7749e017d9335f58497404d1350e96caf471
prerequisite-patch-id: 3526c9154f581497a11465b936d83ef61a875454
prerequisite-patch-id: 65d8c757b52475c2acc7d22ddc92cd3f0152b55d
prerequisite-patch-id: 4bd31f1414d5248dc080884caadf5f21684a8427
prerequisite-patch-id: 7beadbb0da3e589ed86d12f512d1c83427dd82b4
prerequisite-patch-id: f04f5427c592cb078c08ee071b965ef6fd4a9a48
prerequisite-patch-id: 64c0098c3d2420f82c89f44fccd3eed459557bfc
prerequisite-patch-id: 3294340ecd964b8e3e87e5a787ff1ffa28e0b698
prerequisite-patch-id: b2c14d06f068dc6a52814fc55d1188737dc29861
prerequisite-patch-id: c7fd96983b606bc42cc5b003022b8fa2bb1c0c34
prerequisite-patch-id: 8e9f4c2d5521fb6cdc5bed2d6661f4bbed5eb63d
prerequisite-patch-id: d868f7925ee9dfe44c5ddf50f4deb50263ff203f
prerequisite-patch-id: 5677248690560ec45e512a8cdbbf8aecfad62d77
prerequisite-patch-id: 5d9674da330ee9d0f4c91edb8acc20727ba1cd9c
prerequisite-patch-id: d5f29453bfd2e3354fb96b57d7a55521bedb2b0b
prerequisite-patch-id: 9d6f96e26fe651304e950766d6bc2006dd33e86a
prerequisite-patch-id: c7a73c58c6d4ca8556d29ce651ad78cc647f6f31
prerequisite-patch-id: c5f35030637e78ab6f5fa489172f1506493fbae1
prerequisite-patch-id: aad19e48d4fa45734050bba927a5b72d6def9673
prerequisite-patch-id: 1bc25d63f6ecf871f91c4e2e826d0428b0bfdebf
prerequisite-patch-id: 783efb230fcd0dd0acbc39e14b85e72a81c3399b
prerequisite-patch-id: 4a3e84720c2f749d1d106bbaa370b179bd8284a9
prerequisite-patch-id: aaf9acfbc9412c4c1c48692b869a54f45fa3f67d
prerequisite-patch-id: 52b17274481cc770c257d8f95335293eca32a2c5
prerequisite-patch-id: 6ab09768759461c6bea5d4a0833d50e3e41067f1
prerequisite-patch-id: 852a6d1e9ce6e9d6d5de0cf59017b83c9b52ca7c
prerequisite-patch-id: 518e8e38f50e260c97e4441cf1a2f43bc7aff7d5
prerequisite-change-id: 20251114-rust_leds-a959f7c2f7f9:v15
prerequisite-patch-id: f1f61d450bbf7691b4f886e6b0bd6dde870e907d
prerequisite-patch-id: d128e87508ed9bf7a8536e3c327aedce302e2734
prerequisite-patch-id: 1f4466cfb2afcc0f7a317f0180a7155ed2cd72b0



