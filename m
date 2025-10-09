Return-Path: <linux-leds+bounces-5686-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1351FBC81A5
	for <lists+linux-leds@lfdr.de>; Thu, 09 Oct 2025 10:44:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B5034227B1
	for <lists+linux-leds@lfdr.de>; Thu,  9 Oct 2025 08:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43AB42D24BD;
	Thu,  9 Oct 2025 08:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFTsZVaj"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB232D23B9
	for <linux-leds@vger.kernel.org>; Thu,  9 Oct 2025 08:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759999446; cv=none; b=U88WTO1j9icJiNRMoodbZhR704u5PckDDzRdyLNWpMFIDq2AeOg572x2eDCocODSeVbMKQHb9geMYPNI/wQzurZN1Z8k9WgoiPJ5fp/fvcluxdaFOTabK12fO5rr89gPsNhwMK34RNv2OiPItdNQ6XOkb/+SnS23kgz4qX1sqWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759999446; c=relaxed/simple;
	bh=V3w1zvSR3okAXJG16PIt9XbHZe0JiZIT01Wxw6lz8LQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HAoFBpsI6Zd1iZyMYZoTBcXUYy2V3SrQBwTH5+s2HFaBUwlBQsULpUwqPvHZ5CTB4AB8+NrIVblcfEZuAJpL2hgNcXP9YNxC0Jx3F31iNVdo3Eq2RjY9C1Mrh/9M4tukya0majkHZ3JZoBSSgD9a0B5+5OauohZFBhBs4mm2DyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFTsZVaj; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-781db5068b8so591647b3a.0
        for <linux-leds@vger.kernel.org>; Thu, 09 Oct 2025 01:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759999444; x=1760604244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MB25NFjME8NTxFWrVFFyMEzcHfTdeESKK1Z0x76pd70=;
        b=LFTsZVajBojbh8XsLykkjSwEINEjLpasXaDUMjNnIPaxa1t1kYQFBm+fLleix00vBc
         VQUDR0fqI+7SGWOkz2b+JpyuHgah1ZK6HnpCljt6NFQ6GTQODEcpGO1josE2tYk2GfFi
         kkPcwGiGRe67H12yb2xpcDK529JeijimDFClrVVxCOBi9+2+koTBj9zN+wPgWB+sUluV
         HIUS7onKahYq8jjqFGNx+yn2GKWwAbCQEm3bJf8cACVKAJFG/xhhIjy0gUpxEWQO2dGF
         ACTACB+OBM8A/c0mgvSK9yWfbtSz93v28s6M96WactTCPmDqRleAnU5N/GUrUqAPi22o
         wROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759999444; x=1760604244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MB25NFjME8NTxFWrVFFyMEzcHfTdeESKK1Z0x76pd70=;
        b=XzMfOISHc0G5u1mNstjKp7pRe+5X/Kn/G/1nVQNUonip15IyjKSdi/k6eSjCS1vBAY
         BZ8sRbremZbx08lBXwUuAaloNA9MZH9EYqZE9e4dctnXZm9WqTpQWcGWv7RyPkMULDpJ
         gtqaG4LjhCvWyjCmYN9n2wdVnV8o4tSjVT2Jfu45HRTT6VXCiFmnN46ztzY0L8i4b3Ez
         tx0HJNakGlcqyf2tFxnpnQJU8towx+s9SOP/uaPh+n61m7kmdSxTkl7dYE3A/1D1GHGi
         f/yvXNs6bcSi/oSVpunT6uJYdMUCI81aw1O8PsoqfUpWPkvz/aG0E+zGAC80HhCAXObB
         fchw==
X-Forwarded-Encrypted: i=1; AJvYcCW5oRjbEAXE8R8RU+7pINMtuMa2FTQcOlpTrvDQLZNv3fdHd481Kg6C3/oQjIpSmpES1oi6VrHBpGRx@vger.kernel.org
X-Gm-Message-State: AOJu0YxC7pCc9iEflR2zRbhuSXUigUecdzvZk7QURO90cFxrQT6yd+FM
	zIlKR/1Yx0svqWzCAOvSI7kWxpL1xCfrFbqq7lXCsbaxgD/CCFAvuqr5
X-Gm-Gg: ASbGncs1XW1aKEGGZ7wuwydEa43wdwzgyozrGz8z0hsGs9uX7SlWunPNty7Gs+IV5re
	hix4w1vebFUEPxRKyV5b2xpRjUTxymurt1mOAIoRxFd/jNn+dDNAXKOI/w6eiw4bv6EmjY/aTIL
	05TpNlyJnmW73h0U5AHJOa5TInAf2+g7c7yrQeEcBLDVHcd8fe+m1xsYoE7wyO4esUVIby8UT2z
	IfBeP17Ir7d5ZCRf+rjyOVgLYeu9vrYhQXkXwaOKO11WnxBUT+aE7XMxkFE62XVKLGgZkNKA4Ox
	xO9JOB82y/iY8j2upST9AbRNd3JZcL12WN9mvuQdBjGeOfDEK+bwrgKcxrPRcy4jq7HIqcGduzs
	5bTsgGXttiqpNq+L7W+0JR7UXfm3Iodo7jG74vpblJjAXGYyhHtLJmrIbNI6i6jl9ikKb
X-Google-Smtp-Source: AGHT+IFe7GjprHppsCNfLgq3n4ZLOEQrgQ8f7e8BgECl0+RG44szvIm40ljHdHtpTq8yqQEIov+KKw==
X-Received: by 2002:a05:6a00:1883:b0:77f:4a83:8f9 with SMTP id d2e1a72fcca58-793859f34c4mr8541151b3a.2.1759999443863;
        Thu, 09 Oct 2025 01:44:03 -0700 (PDT)
Received: from MRSPARKLE.localdomain ([206.83.103.239])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-794e06fb374sm2141633b3a.56.2025.10.09.01.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 01:44:03 -0700 (PDT)
From: Jonathan Brophy <professorjonny98@gmail.com>
To: lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Jonathan Brophy <professor_jonny@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH 3/4] ABI: sysfs-class-leds-virtualcolor: Document sysfs
 entries for Virtual Color LEDs
Date: Thu,  9 Oct 2025 21:43:38 +1300
Message-ID: <20251009084339.1586319-3-professorjonny98@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009084339.1586319-1-professorjonny98@gmail.com>
References: <20251009084339.1586319-1-professorjonny98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Jonathan Brophy <professor_jonny@hotmail.com>=0D

Add sysfs-class-leds-virtualcolor to document Virtual Color drover sysfs=0D
entries=0D
=0D
Co-developed-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>=0D
Signed-off-by: Jonathan Brophy <professor_jonny@hotmail.com>=0D
---=0D
 .../ABI/sysfs-class-leds-virtualcolor         | 43 +++++++++++++++++++=0D
 1 file changed, 43 insertions(+)=0D
 create mode 100644 Documentation/ABI/sysfs-class-leds-virtualcolor=0D
=0D
diff --git a/Documentation/ABI/sysfs-class-leds-virtualcolor b/Documentatio=
n/ABI/sysfs-class-leds-virtualcolor=0D
new file mode 100644=0D
index 000000000..60b878791=0D
--- /dev/null=0D
+++ b/Documentation/ABI/sysfs-class-leds-virtualcolor=0D
@@ -0,0 +1,43 @@=0D
+What:		/sys/class/leds/<led>/priority=0D
+Date:		August 2025=0D
+Contact:	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>=0D
+Description:	(RW) Priority level of the virtual LED group. Higher numbers=
=0D
+        indicate higher priority. When multiple virtual LED groups are=0D
+        active, only the highest priority group's state will be applied=0D
+        to the physical LEDs.=0D
+=0D
+        Valid values: 0 to INT_MAX=0D
+        Default: 0=0D
+=0D
+What:		/sys/class/leds/<led>/blink_delay_on=0D
+Date:		August 2025=0D
+Contact:	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>=0D
+Description:	(RW) The time in milliseconds that the LED should be on while=
=0D
+        blinking. Setting both blink_delay_on and blink_delay_off to=0D
+        zero disables blinking.=0D
+=0D
+        Valid values: 0 to ULONG_MAX=0D
+        Default: 0=0D
+=0D
+What:		/sys/class/leds/<led>/blink_delay_off=0D
+Date:		August 2025=0D
+Contact:	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>=0D
+Description:	(RW) The time in milliseconds that the LED should be off whil=
e=0D
+        blinking. Setting both blink_delay_on and blink_delay_off to=0D
+        zero disables blinking.=0D
+=0D
+        Valid values: 0 to ULONG_MAX=0D
+        Default: 0=0D
+=0D
+What:		/sys/class/leds/<led>/brightness=0D
+Date:		August 2025=0D
+Contact:	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>=0D
+Description:	(RW) Brightness value for the virtual LED group. This value i=
s=0D
+        applied to all monochromatic LEDs in the group if this group=0D
+        has the highest priority among active groups.=0D
+=0D
+        When read-only mode is enabled via device tree, writes to this=0D
+        attribute will return -EPERM.=0D
+=0D
+        Valid values: 0 to LED_FULL (usually 255)=0D
+        Default: LED_OFF (0)=0D
\ No newline at end of file=0D
--=0D
2.43.0=0D

