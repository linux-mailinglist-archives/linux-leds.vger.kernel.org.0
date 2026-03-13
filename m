Return-Path: <linux-leds+bounces-7334-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELUXFMNftGmKmgAAu9opvQ
	(envelope-from <linux-leds+bounces-7334-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 13 Mar 2026 20:04:35 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E53A8289137
	for <lists+linux-leds@lfdr.de>; Fri, 13 Mar 2026 20:04:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99DCD3186C14
	for <lists+linux-leds@lfdr.de>; Fri, 13 Mar 2026 19:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C701A3E0C55;
	Fri, 13 Mar 2026 19:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d3Fds5DX"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36050337BA4;
	Fri, 13 Mar 2026 19:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773428609; cv=none; b=rBFiCHTpIgbNUiIxIyXbJiJY+oOCqzWXQHjUYGuu9yOM9979feIxYXIcKWawYmSyR3qG8fezzBHUF+zhALNcDutKywbiV84Qv/ICA4AMYGRLmiey7yC4m6FWYyPhUpRR+uvOmdBTojrGfZ+/Pra7hFgh55MPMSi+Tvc4UqoM10w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773428609; c=relaxed/simple;
	bh=Bksge0BwZIZRSlux7ElMK3YW88ScPyqClLpzxyD7WoM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lo2oVGWQy610YMXM6uVZPiw4XkfkfeF4gRk26mgvnTDY5tZFu7x5ndCi4L4FrwzRe6ef6dGiulOmY1bIAkKQwkGrOwJ8uw2BFwm3Uzn+lJmjnXvL3nLP//500m+mt4UTJQlpwfqPs3JyvG8ONziCm7IC0G6KfDVsnSY3EqMihsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d3Fds5DX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A76AC2BCB5;
	Fri, 13 Mar 2026 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773428608;
	bh=Bksge0BwZIZRSlux7ElMK3YW88ScPyqClLpzxyD7WoM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=d3Fds5DXUU0RJrPsweowB8IsWH0+VPxuzLh4NyE/eo6X/HvFZlMvIGszvnbi+PifN
	 ke1u40jr/eKQA5IpHCEZhIRd/x4YFKoZKuB/P2eGul4mTba2OKcp1HVnFQ486HAtBs
	 89w6UUA7EHKzujRT6gTqnguKhvx7wGoHDs+I5EgAm5Ph+nF7IrJZK0EK6lkYI9u7IS
	 egJdhO/j8J4un38lIxcdSf/2RS/dHczDjf0O+StPsOs0zyeeyNVP/IRIVMZCQ+NWFq
	 xVMJiKMajFyQ9uq4+a3/OBZENulU2vQDnM2Zj+L4BsHcD0Ajxrj3EyXLT3I8ERA8cK
	 sOGHvTB3FbmaA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71262107BCD0;
	Fri, 13 Mar 2026 19:03:28 +0000 (UTC)
From: Markus Probst via B4 Relay <devnull+markus.probst.posteo.de@kernel.org>
Date: Fri, 13 Mar 2026 20:03:08 +0100
Subject: [PATCH v3 4/7] mfd: match acpi devices against PRP0001
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-synology_microp_initial-v3-4-ad6ac463a201@posteo.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2049;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=hBb7npui0bE9foF8ScZ10sjTmUwGIOBRFmkU8LUvBWM=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBptF93eoVl4DjsVgQ72oaZooBCN5wvnCfEb4Bga
 W4Ay9kmUaiJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCabRfdxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQNHYf+OetQ9L3fhAAhjV2cdrYE2uf7iM0x/J1I4s8JWTDwfI
 xc+elomemxd+j6pR0OhuKw3DggNCb1dc8H6scm/wv+zqfc0xBKay+QT8Ff3XjZvcfV1U4R3Oyct
 eyEhtj30Es5qqTjIPLNA1R3NAU3H7lhnUTviHadma7MR00Va9hVUetjEmHx4YDlIepo5n1NNIfU
 XYlU+dEoRsJ0f74IAhjc0He6zdNLSlLzP7pde5aQLNMq1egTwt42unDrVA6N6Ds++Dzm3ufmCTx
 fcFTLqoTm9S+A0E+Iie9+3KsPkqsyDY79insqEc8Liv7iqCRtzPrE4GLHh3zYT6pXSMDf/t85Cg
 IvRUpVxq7plwWrYa7C/s17zVOPhv9NxYSsIldWuUZKqwzJ6Q8xS9HXLA8BCW3XY7OMU6+Qrudjp
 Qoq/uDrkEHNgAxFHJcxq/L+o89nhnf7dWy0kbljzJaFs4ahpWzmX+BCWp7NtPKfppwnUoTK16va
 AayxkUxyh1wVVjMwONb4gJImT9Db6YrEzenviJbys/YZpUwQibiBDgRqO0vEuNntLTzChNLekHd
 bwO+Ca+pBIF05iMu5dk+WfKPtFU8QnXMkSbn7rVm3rkCLGJgYqUz4kTbLWWkCO66okvXGyT20ul
 nZnHj0MwmDpnd7JKqoESSpaXvpiIAb85zKiiOJMc8kBZFfobEKLQ=
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7334-lists,linux-leds=lfdr.de,markus.probst.posteo.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	HAS_REPLYTO(0.00)[markus.probst@posteo.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:email,posteo.de:replyto,posteo.de:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E53A8289137
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Markus Probst <markus.probst@posteo.de>

PRP0001 can be used to provide DT-compatible device identification in
ACPI. If the mfd device is bound to a acpi fwnode and no acpi_match data
is provided by the driver, match against PRP0001 and the provided
`of_compatible` string.

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 drivers/mfd/mfd-core.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
index 6be58eb5a746..29bf54664acf 100644
--- a/drivers/mfd/mfd-core.c
+++ b/drivers/mfd/mfd-core.c
@@ -39,6 +39,10 @@ struct match_ids_walk_data {
 	struct acpi_device_id *ids;
 	struct acpi_device *adev;
 };
+struct match_of_ids_walk_data {
+	const struct of_device_id *ids;
+	struct acpi_device *adev;
+};
 
 static int match_device_ids(struct acpi_device *adev, void *data)
 {
@@ -52,10 +56,23 @@ static int match_device_ids(struct acpi_device *adev, void *data)
 	return 0;
 }
 
+static int match_of_device_ids(struct acpi_device *adev, void *data)
+{
+	struct match_of_ids_walk_data *wd = data;
+
+	if (!acpi_of_match_device_ids(adev, wd->ids)) {
+		wd->adev = adev;
+		return 1;
+	}
+
+	return 0;
+}
+
 static void mfd_acpi_add_device(const struct mfd_cell *cell,
 				struct platform_device *pdev)
 {
 	const struct mfd_cell_acpi_match *match = cell->acpi_match;
+	const char *of_compatible = cell->of_compatible;
 	struct acpi_device *adev = NULL;
 	struct acpi_device *parent;
 
@@ -86,6 +103,16 @@ static void mfd_acpi_add_device(const struct mfd_cell *cell,
 		} else {
 			adev = acpi_find_child_device(parent, match->adr, false);
 		}
+	} else if (of_compatible) {
+		struct of_device_id ids[2] = {};
+		struct match_of_ids_walk_data wd = {
+			.adev = NULL,
+			.ids = ids,
+		};
+
+		strscpy(ids[0].compatible, of_compatible, sizeof(ids[0].compatible));
+		acpi_dev_for_each_child(parent, match_of_device_ids, &wd);
+		adev = wd.adev;
 	}
 
 	device_set_node(&pdev->dev, acpi_fwnode_handle(adev ?: parent));

-- 
2.52.0



