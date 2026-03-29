Return-Path: <linux-leds+bounces-7576-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KOUCG9pyWnqxwUAu9opvQ
	(envelope-from <linux-leds+bounces-7576-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 20:03:27 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A51673537ED
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 20:03:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30195301AB9B
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 18:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6E3387354;
	Sun, 29 Mar 2026 18:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y8Fnndf2"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AAB386578;
	Sun, 29 Mar 2026 18:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774807361; cv=none; b=rP4dSj9l4Jj/x4llbxsgAToUAv9Vky+OK9Gc3I2q2l3uKXv2r6owAj6Icbb/afuNT+v7os5gTlEN1FcW7zhxNl37WsAsIWu+BljX5ay6+Rw5K9KcWF7925AxjnaIRXL/Q3KaQItcgHgbLxwER6KIdqFPfg3ijUHDwv+34ePWcjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774807361; c=relaxed/simple;
	bh=G0FGzYXDDW4R9eGPWkahJ7X/ZrWEJvdqlnXvnLxXd54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JkevLbs2G4dCoWeN7g/OJZKPYrMaDGNkfTmScIvVpMbPIYMGsVYPQKwL0FeWUz7GP36Ll9DeKGM1sjpemUVeKxvhQrTXrdg7u6m/SeIW6njFq7V6v0KiIqm+ULEiiB0OteI8iWU/d7Nyv0q2TnaAr5X2Ef+GHfasPXbvHGNazwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y8Fnndf2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 704A8C2BCB1;
	Sun, 29 Mar 2026 18:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774807360;
	bh=G0FGzYXDDW4R9eGPWkahJ7X/ZrWEJvdqlnXvnLxXd54=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Y8Fnndf220bgT/tYw+7Ak/AswOVy0Gd3/haR9ABW7nxutHIt0S1zvdwQCh61SiEuj
	 bo22MEVBEqdEGs3I6ftGkydkhfPIu1DsIacDqBhSRX1VNd6Y7NfVm8CnoRvX1PrPil
	 udMXNwrJriAA51OmPoWznf9uvlG0hlltd84suuGjBQuIQTBKvbxbGZztT6kEY57hJA
	 /fHHIex20nxUj61wM6ZkcWeIJ+MmnPRZ63O/tSnq9hbC7hwK/O7RqwfMPa6lWin3b+
	 IQKSNw0frRlH4wIZ0gjbf2I2h0NLPNO3frVl0CJMs/6nh34Boi8X1Na+Qh4KUDZDKN
	 1NdsgQosXQwvA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CDD7F3D61F;
	Sun, 29 Mar 2026 18:02:40 +0000 (UTC)
From: Markus Probst via B4 Relay <devnull+markus.probst.posteo.de@kernel.org>
Date: Sun, 29 Mar 2026 20:02:16 +0200
Subject: [PATCH v5 2/4] ACPI: of: match PRP0001 in of_match_device
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-synology_microp_initial-v5-2-27cb80bdf591@posteo.de>
References: <20260329-synology_microp_initial-v5-0-27cb80bdf591@posteo.de>
In-Reply-To: <20260329-synology_microp_initial-v5-0-27cb80bdf591@posteo.de>
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Saravana Kannan <saravanak@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-acpi@vger.kernel.org, 
 Markus Probst <markus.probst@posteo.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3479;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=HMCBaJI1P1YqAkteFmwT2ODjJk1KjOq1Yh0ug86s1zs=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBpyWk64tit0EV5IRL2Ka6xmKM30y1j9EVJH02Ji
 fJerO0lS5+JAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCaclpOhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQNHYf+OetQ9J7HhAAjkadI0ejYpWk+cSPgdRrBvZshABIbgZ
 GQxgme4t6lF1yir06RFgZ4DX9OiuYb3uNNb9sEML4Rc+pmpQMqj49ucyUWhmJ8Ck8GsFJZy3uz1
 x52L159LhE7fnrRpft71UTe9QuN7KbK8hVW3l/HYQOpa+bh0K1s/dNcH8G7JMyJk6cLX9Dgu/uJ
 R1VWPjOcCyM+wQdZ9Nsx27sUInClzLYS3IkFFIF0aCm5K0X4GdsCQOzsNJHVEdNMQwtTfKSBZKo
 XDR1D46AGw8atrYG/Lz18Q0nKzjTnYrQimTiv2SkzON6c9z1o/OFC7jQNH1ewKTy8+pQ0omYHUN
 2QgE0iLkoSVJxW6CLIQd8r1V+wOurWApv0dI01lzIa28uNrn1uxLUCmtC3ugdxoudexVj3XR5xZ
 F0bbHkrm+1lVIA6cK46JaFCbJ/eFKCOx28q9uzRmHcCGnRuuItmtogtRiVVf5lIy+6uFp491/0l
 yFsIhX27UgnOEMGPdyEPKi9eskCdpM+F6Uzjhf+MIZxRB1bK5vtJV5mpKgJ5r+/DtKqCx+1+WGb
 VhtDnr91ra0PsNEKzqJoHjdfFZrZjDeQo5GReIeWr1BVPUVqHU7QfnotHPItj6dhzcSP3LyMIB3
 Dhd4hoPqw/HnYDOvAxwf5IhSzTTfCw/RQ7GuTNwZTmF5Gs2918pU=
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
	TAGGED_FROM(0.00)[bounces-7576-lists,linux-leds=lfdr.de,markus.probst.posteo.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
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
X-Rspamd-Queue-Id: A51673537ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Markus Probst <markus.probst@posteo.de>

Export `acpi_of_match_device` function and use it to match for PRP0001
in `of_match_device`, if the device does not have a device node.

This fixes the match data being NULL when using ACPI PRP0001, even though
the device was matched against an of device table.

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 drivers/acpi/bus.c   |  7 ++++---
 drivers/of/device.c  |  9 +++++++--
 include/linux/acpi.h | 11 +++++++++++
 3 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index 2ec095e2009e..cd02f04cf685 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -831,9 +831,9 @@ const struct acpi_device *acpi_companion_match(const struct device *dev)
  * identifiers and a _DSD object with the "compatible" property, use that
  * property to match against the given list of identifiers.
  */
-static bool acpi_of_match_device(const struct acpi_device *adev,
-				 const struct of_device_id *of_match_table,
-				 const struct of_device_id **of_id)
+bool acpi_of_match_device(const struct acpi_device *adev,
+			  const struct of_device_id *of_match_table,
+			  const struct of_device_id **of_id)
 {
 	const union acpi_object *of_compatible, *obj;
 	int i, nval;
@@ -866,6 +866,7 @@ static bool acpi_of_match_device(const struct acpi_device *adev,
 
 	return false;
 }
+EXPORT_SYMBOL_GPL(acpi_of_match_device);
 
 static bool acpi_of_modalias(struct acpi_device *adev,
 			     char *modalias, size_t len)
diff --git a/drivers/of/device.c b/drivers/of/device.c
index f7e75e527667..128682390058 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -11,6 +11,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
+#include <linux/acpi.h>
 
 #include <asm/errno.h>
 #include "of_private.h"
@@ -26,8 +27,12 @@
 const struct of_device_id *of_match_device(const struct of_device_id *matches,
 					   const struct device *dev)
 {
-	if (!matches || !dev->of_node || dev->of_node_reused)
-		return NULL;
+	if (!matches || !dev->of_node || dev->of_node_reused) {
+		const struct of_device_id *id = NULL;
+
+		acpi_of_match_device(ACPI_COMPANION(dev), matches, &id);
+		return id;
+	}
 	return of_match_node(matches, dev->of_node);
 }
 EXPORT_SYMBOL(of_match_device);
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 4d2f0bed7a06..1cf23edcbfbb 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -736,6 +736,10 @@ const struct acpi_device_id *acpi_match_acpi_device(const struct acpi_device_id
 const struct acpi_device_id *acpi_match_device(const struct acpi_device_id *ids,
 					       const struct device *dev);
 
+bool acpi_of_match_device(const struct acpi_device *adev,
+			  const struct of_device_id *of_match_table,
+			  const struct of_device_id **of_id);
+
 const void *acpi_device_get_match_data(const struct device *dev);
 extern bool acpi_driver_match_device(struct device *dev,
 				     const struct device_driver *drv);
@@ -965,6 +969,13 @@ static inline const struct acpi_device_id *acpi_match_device(
 	return NULL;
 }
 
+static inline bool acpi_of_match_device(const struct acpi_device *adev,
+					const struct of_device_id *of_match_table,
+					const struct of_device_id **of_id)
+{
+	return false;
+}
+
 static inline const void *acpi_device_get_match_data(const struct device *dev)
 {
 	return NULL;

-- 
2.52.0



