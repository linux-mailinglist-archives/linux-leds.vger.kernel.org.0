Return-Path: <linux-leds+bounces-7330-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMJmKM9ftGmKmgAAu9opvQ
	(envelope-from <linux-leds+bounces-7330-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 13 Mar 2026 20:04:47 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA66289174
	for <lists+linux-leds@lfdr.de>; Fri, 13 Mar 2026 20:04:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68C4831D5F4B
	for <lists+linux-leds@lfdr.de>; Fri, 13 Mar 2026 19:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 875823DFC93;
	Fri, 13 Mar 2026 19:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c9WEgRCQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D6D3E022C;
	Fri, 13 Mar 2026 19:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773428609; cv=none; b=q6fTF1rBC+mgr2C4C7Ny027B6Cp1UQnej8d6tLVUG0HkbfYc6hzvw0diVBmMAzw5+6uieWGIHWaPHNxZC8xMDAWBRLO2JmlJhzh0I1FEL8XA0nwxN9s9zLQUvqiw73e8xRH6Agdv8KoBlmpqg6E78c6VYpRGp4AAjEezCQa6RKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773428609; c=relaxed/simple;
	bh=WNyrV6cUJd1MCtALLHhcaw4UwpQ9xMid5GgH1ipI1uw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jF5rl/XeHg3ANCzicet7zrfddVmgEOO6EaGubRcjVo5jYcP/HkLTfZi5cvMmRHK0PhyJFo4Hyf9YJTWWeIVReCt2DB4EoNbPKYphAhSYr/hKcXScyuibOGqPCfeAm2blrITU9ZJlMFZRgUTj60494GhiX8Bei9eYlt3H/It1gic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c9WEgRCQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46122C4AF0C;
	Fri, 13 Mar 2026 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773428608;
	bh=WNyrV6cUJd1MCtALLHhcaw4UwpQ9xMid5GgH1ipI1uw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=c9WEgRCQSq0ifZQWywjVc93Z4fYUZfib6INXYaPZOf4Pa07RWRBgAQo6rdA69IR3C
	 /e0W74+8qD9M9iFkQf/OHGvTBDalTsAzS9MO1mzEuPQyzkv0lB7DsSukQ40E25mtcs
	 1vAjkr4SRdqEZRL6gHINzpxeMPyMIp4NbNizKPStf7kIc2DqxJt/TRv0udYzSdbjxR
	 k+pdn0ihLfhq+uDFN0sMJ76X+bKTeuLDmAUECr8BRrbjtZwxNkaiWFVK7iAUGsBOGm
	 iu9gdTHTLqnnTMlqlvShhYuC0rFEHRNDXLuaURofx+R+VN2obdUZ/xZ9YkNTqqBJvv
	 mc5hYKW8XSocQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B0F7107BCDD;
	Fri, 13 Mar 2026 19:03:28 +0000 (UTC)
From: Markus Probst via B4 Relay <devnull+markus.probst.posteo.de@kernel.org>
Date: Fri, 13 Mar 2026 20:03:07 +0100
Subject: [PATCH v3 3/7] acpi: add acpi_of_match_device_ids
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-synology_microp_initial-v3-3-ad6ac463a201@posteo.de>
References: <20260313-synology_microp_initial-v3-0-ad6ac463a201@posteo.de>
In-Reply-To: <20260313-synology_microp_initial-v3-0-ad6ac463a201@posteo.de>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Igor Korotin <igor.korotin.linux@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
 linux-pci@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
 Markus Probst <markus.probst@posteo.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1613;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=GJ3md6hqtAxzfdBZYmqM+I2WL+pybDm9TmsuESz9lJ4=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBptF913ngpPcMcdUQwBIgHq7F7VzFVgL/AY67jx
 svY0kKc3OKJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCabRfdRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQNHYf+OetQ9LkNg//bCn1Kd+N6ljQZDQEebMvChN3dphvi1c
 JNF9qbgFodbcU4BIFx7T8XQ8KXpBoORI0YxeXgRHUnqGbPpcyeCObRFd7ciSKCMpniWpzDuN1GE
 55vld+kUH+kCJCAHxj3uD3aPxn8e7ewuDXqns8NaqWxPsDHE0mjkuKLtUoLdi0m8p0tCV1KNrF3
 WWQWPtoa0MpaVlIz68xUxfpKkWcwXSKisntVCuHRB7fUGbkoBG6ewFPxai7OwVz58wYYF8qaMY0
 KtM6BU6H2FBNZMZ4BXj/TkKtX9IXz2dhwacbiAXlICtp36ZFtDQDiqQdgKpbKg/U3A1bmDZoJev
 XWoeg+XwuLcI6BIRCSTnsWShSO8gZtCBSpjR8zIR96fADSNuSvNwze128AS4h2ApAf2a20w00FB
 JG983Sp8SXAezefYSb54K7tp3WJ7RSl9NXahg69vtzWSoLB9uU0p+0WlwJ9cF7mb3Xnkp34GgxJ
 fwN9IhRLjSZFFdF+9oXeNNdaob6iHiP4M1qZSFFK1cjV8vQ5t7Wpj/DGU+8EMKkN6/cOKdJZZd4
 A5g32ESjeTedyxOxFIOi1oD39zEBZCd7fiIqYj4uxT8tCLsYslNbegGBON1a2xTChUUOxAZ1yG0
 gtgcL/kW7JQ3IMZf4yAC3sOtDJwLqZ2CWL1uesYUXGav6f2WlaAI=
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7330-lists,linux-leds=lfdr.de,markus.probst.posteo.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,collabora.com,intel.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-leds@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	HAS_REPLYTO(0.00)[markus.probst@posteo.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:email,posteo.de:replyto,posteo.de:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4FA66289174
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Markus Probst <markus.probst@posteo.de>

Add a function to match acpi devices against of_device_ids. This will be
used in the following commit ("mfd: match acpi devices against PRP0001")
to match mfd sub-devices against a of compatible string.

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 drivers/acpi/bus.c      | 7 +++++++
 include/acpi/acpi_bus.h | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index f6707325f582..5ddcc56edc87 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -1044,6 +1044,13 @@ int acpi_match_device_ids(struct acpi_device *device,
 }
 EXPORT_SYMBOL(acpi_match_device_ids);
 
+int acpi_of_match_device_ids(struct acpi_device *device,
+			  const struct of_device_id *ids)
+{
+	return __acpi_match_device(device, NULL, ids, NULL, NULL) ? 0 : -ENOENT;
+}
+EXPORT_SYMBOL(acpi_of_match_device_ids);
+
 bool acpi_driver_match_device(struct device *dev,
 			      const struct device_driver *drv)
 {
diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index aad1a95e6863..0081b9e4aaee 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -677,6 +677,8 @@ void acpi_bus_trim(struct acpi_device *start);
 acpi_status acpi_bus_get_ejd(acpi_handle handle, acpi_handle * ejd);
 int acpi_match_device_ids(struct acpi_device *device,
 			  const struct acpi_device_id *ids);
+int acpi_of_match_device_ids(struct acpi_device *device,
+			  const struct of_device_id *ids);
 void acpi_set_modalias(struct acpi_device *adev, const char *default_id,
 		       char *modalias, size_t len);
 

-- 
2.52.0



