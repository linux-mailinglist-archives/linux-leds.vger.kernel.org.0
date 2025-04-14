Return-Path: <linux-leds+bounces-4470-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBA1A8849D
	for <lists+linux-leds@lfdr.de>; Mon, 14 Apr 2025 16:23:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A93EB163EB7
	for <lists+linux-leds@lfdr.de>; Mon, 14 Apr 2025 14:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 160AC2951AD;
	Mon, 14 Apr 2025 13:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=helmholz.de header.i=@helmholz.de header.b="eCHTWpIb"
X-Original-To: linux-leds@vger.kernel.org
Received: from www253.your-server.de (www253.your-server.de [188.40.28.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0382951AE;
	Mon, 14 Apr 2025 13:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.28.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744638929; cv=none; b=EKRPr2D53LRLoZYX8Pr7Ue6OOMgnhpv07/FfxdZmeoqrtSmrKJx+gm+SNMjPEoSfZxFqwl27xAxiCsyyEgtqaeHF0YxhXcQSxf1axeBMP9B8nkCeclgL8oPOYfoBvS3hcZrVwIRya3wYy0gJSIL3oWdVaZLFJtbLAVucksr+xwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744638929; c=relaxed/simple;
	bh=igvVhZwd/Ulfb6vrRtQg6x0bd/OGH+dCTEkj4H8CKu8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 In-Reply-To:References; b=OQGkvoojszSIOd+JWEM8Wi31pN/Goc303dlGs2e76vlq9vd2te0+jMUmdCfbAO4DNAzm3DKcfACFZ8rWPpP3FW5g34YtZKfNWbnSH72O65Grxhixf1uyVIoDnuhf4b8UGz+Xuq5KsxAOxmRjlwzKJlE4PpLV9CS74OKsmi3s/u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=helmholz.de; spf=fail smtp.mailfrom=helmholz.de; dkim=pass (2048-bit key) header.d=helmholz.de header.i=@helmholz.de header.b=eCHTWpIb; arc=none smtp.client-ip=188.40.28.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=helmholz.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=helmholz.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=helmholz.de
	; s=default2501; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=TNkqmEo16GnI2EiGH0GEi7u9cbC1rWK0sSwViXXy5sQ=; b=eCHTWpIb6W1zdq1gLrrWQiFLoI
	pvcelLCeE+OYN9oSqYECRDddklQfUJF9FtHh7quc3gzBMdQOyOLqAysMQ2LxKWFOGfhA73gRdC/fn
	ofdeInq6zVFM8gw7k7/T+EaehSFIIwFmImElT48b8Xywj2Lg/FG2muxCsQX0XV8wspMt2zS7omF7m
	q8wh/0RnfpM/WWrNxD3lu9C9q0/P4QKCNVJs9xR6FZ+sbLjZQ6hBQfEOQmZ8cbL/+Pd0tS3z7QVWp
	PQW9uxtYD5aBLyWfeieKFo/HSIZsS6pmtpYjsRD7Cmuj6Fee8AVnfjcDWUjZxjMoznxdvKcywOBhM
	2k6LRsHw==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www253.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <ante.knezic@helmholz.de>)
	id 1u4JsT-0008nT-0M;
	Mon, 14 Apr 2025 15:29:33 +0200
Received: from [217.6.86.34] (helo=linuxdev.helmholz.local)
	by sslproxy08.your-server.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA
	(Exim 4.96)
	(envelope-from <ante.knezic@helmholz.de>)
	id 1u4JsS-000Eer-27;
	Mon, 14 Apr 2025 15:29:32 +0200
From: Ante Knezic <ante.knezic@helmholz.de>
To: linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	knezic@helmholz.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 1/3] Documentation: leds: Add docs for Wurth Elektronik WL-ICLED
Date: Mon, 14 Apr 2025 15:28:49 +0200
Message-Id: <7f324a9a25ad1ac3a622aa1201cbd91ead80f8f9.1744636666.git.knezic@helmholz.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1744636666.git.knezic@helmholz.com>
References: <cover.1744636666.git.knezic@helmholz.com>
In-Reply-To: <cover.1744636666.git.knezic@helmholz.com>
References: <cover.1744636666.git.knezic@helmholz.com>
X-Authenticated-Sender: knezic@helmholz.com
X-Virus-Scanned: Clear (ClamAV 1.0.7/27608/Mon Apr 14 10:34:28 2025)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

From: Ante Knezic <knezic@helmholz.com>

Basic description of WL-ICLED RGB LEDs from Wurth Elektronik

Signed-off-by: Ante Knezic <knezic@helmholz.com>
---
 Documentation/leds/index.rst         |  1 +
 Documentation/leds/leds-wl-icled.rst | 69 ++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 Documentation/leds/leds-wl-icled.rst

diff --git a/Documentation/leds/index.rst b/Documentation/leds/index.rst
index 76fae171039c..b9a4db72cc26 100644
--- a/Documentation/leds/index.rst
+++ b/Documentation/leds/index.rst
@@ -30,3 +30,4 @@ LEDs
    leds-sc27xx
    leds-st1202
    leds-qcom-lpg
+   leds-wl-icled
diff --git a/Documentation/leds/leds-wl-icled.rst b/Documentation/leds/leds-wl-icled.rst
new file mode 100644
index 000000000000..0e55683e9468
--- /dev/null
+++ b/Documentation/leds/leds-wl-icled.rst
@@ -0,0 +1,69 @@
+=================================================
+Kernel driver for WL-ICLED from Wurth Elektronik
+=================================================
+
+Description
+-----------
+The WL-ICLEDs are RGB LEDs with integrated controller that can be
+daisy-chained to a arbitrary number of units. The MCU communicates
+with the first LED in chain via SPI interface and can be single or
+two wire connection, depending on  the model.
+
+Single wire models like 1315050930002, 1313210530000, 1312020030000 and
+1312121320437 are controlled with specific signal pattern on the
+input line. The MCU is connected to input line only via SPI MOSI signal.
+For example WE-1312121320437 uses following signal pattern per one LED:
+
+|          RED            |          GREEN          |           BLUE          |
+| GAIN:4bits | PWM:12bits | GAIN:4bits | PWM:12bits | GAIN:4bits | PWM:12bits |
+
+ where logical 1 is represented as:
+ (V)^
+    |          T
+    |<-------1.2us------->
+    |
+    +================+
+    | <---0.9us----> |
+    |                |
+    +----------------+===|------> t
+
+ and logical 0 is represented as:
+ (V)^
+    |          T
+    |<-------1.2us------->
+    |
+    +=====+
+    |0.3us|
+    |     |
+    +-----+==============|------> t
+
+To generate the required pattern with exact timings SPI clock is selected
+so that it devides T in 8 equal parts such that a logical true symbol can be
+represented as 1111 1100 and a logical false can be represented as 1100 0000.
+Single wire LEDs require the MOSI line to be set to low at idle and this should
+be provided by the chip driver if possible or by external HW circuit.
+
+Models 1313210530000, 1312020030000 and 1315050930002 require a slightly
+different signaling scheme where each color of the LED is encoded in
+8 bits.
+
+Two wire LED types do not require specific encoding of the input line as
+both clock and data are provided to each LED.
+
+Additionally, models differ by available controls:
+- WE 1312121320437 provide PWM and GAIN control per each RGB element.
+  Both GAIN and PWM values are calculated by normalising particular
+  multi_intensity value to 4 and 12 bits.
+
+- WE 1315050930246 and 1311610030140 provide PWM control per each
+  RGB element and one global GAIN control.
+  Global GAIN value is calculated by normalising global led brightness
+  value to 5 bits while PWM values are set by particular
+  multi_intensity values.
+
+- WE 1315050930002, 1313210530000 and 1312020030000 provide only PWM
+  control per each RGB element.
+  PWM values are set by particular multi_intensity value.
+
+For more product information please see the link below:
+https://www.we-online.com/en/components/products/WL-ICLED
-- 
2.48.1


