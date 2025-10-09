Return-Path: <linux-leds+bounces-5687-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B41C7BC81AE
	for <lists+linux-leds@lfdr.de>; Thu, 09 Oct 2025 10:45:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BA43422ADB
	for <lists+linux-leds@lfdr.de>; Thu,  9 Oct 2025 08:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B40EA2D23B8;
	Thu,  9 Oct 2025 08:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2uVAKK0"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484852D3226
	for <linux-leds@vger.kernel.org>; Thu,  9 Oct 2025 08:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759999450; cv=none; b=DvEzlFR/N1bYb3QLaEU0Kp+JTxWUR9emT4lSL5HkeV6Rw0N3Np1cLjeDfhaB1uDrBQDoHMwf+lPByM0rNEvmd10DHyGpF5jlesNtvxqrnFL0/Eu0f4Oqh1dM90FXJXnA6GsT+pJelE+MBpd9cwmtdfEl8OOae0VS8Y5TS3Xx2uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759999450; c=relaxed/simple;
	bh=k3m1XT+tVJ9SU1qc7aJbhzhVsswLDKqkHKsOAeavVnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VhC2nV39jVQdNmVw3M5LSNzhdQsgcp29ujILQKLL17GdTmoP19MEcbTPvASPfBUDnMfJXx/g9QeJpH/YlLSogfk37h+jEizERQrc+8FA42c8Wug/0JDKbHDJ/xePHL0oy/qFNqc9hmHkYMMqe/2i0wMhLibYGqXdWUbqbgF087I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d2uVAKK0; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-794f11334adso634190b3a.3
        for <linux-leds@vger.kernel.org>; Thu, 09 Oct 2025 01:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759999449; x=1760604249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7lPxY6O/wb2QYEN/tX+ej2UY9DnTOP3+s/1F27dh2aw=;
        b=d2uVAKK0N+JTVO9S5Zn60Hmev4yHkJZ6lpOknxSONns8ieetWgbKVaXSM40h50kNFS
         yngyNtHLDtzw6cf2wVGhQZIym8B4dG73jzxDIxuEgblcslT9dDLfm66eZLu6VMDKl8/P
         muDbHQOHXRlczmaUGSA02YbRCYp69H3o3Bl4XK/LcySqD/nSQmmJqIHzdGmg+mZSlgHi
         UgscimgWpHmvAozlOUvrmlYfC928HG1RNLU99Mahg+NNtuVCDeMdwBm1LHUKSOo8laI2
         luFNcBqK+4IzRiB/MOv37bLD7KNjb/z6HUZvQJPAb4p5/nCYiGKqA6x772E/z6V3jqI5
         URQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759999449; x=1760604249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7lPxY6O/wb2QYEN/tX+ej2UY9DnTOP3+s/1F27dh2aw=;
        b=agk2P7qJFVmzOQrXdb3TUSlbocHaRovx7ckZz3RusD0IpKTCqTYWJRAl2uDHvS+EaC
         d7K/HoQWAkPYuPHX1K4j+o9FHjktP6wEIYAvdkQSQCA7uIMn9bMQEGObGC2E1zTEno5A
         +lIZjswgbjRBW5ZAaYprDZXNKKl3+4QNUeiPEI8itLERQdM0p2Asf38MTaev5V5Fpn+a
         SiZzHk5h/vVUImKbSqQH2KZ4Hi7EXFWfYs9l10MSspxytjqk+KcV2goVO7IooOSoTs5g
         ymDFtbSZbCvEI5dZUc0R1wz3CaV+TMRcA0zfSXnxZKOuMLMofGMD03FJcV67jAzsBMon
         2OVw==
X-Forwarded-Encrypted: i=1; AJvYcCUk7HpdJbVNkbxGbsYo6SdVeASvQc91bV2pwrKxzyue83ulvoScOjBPnqjnby1RGn0LtNEzdZMHg5IC@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz//DM9vdvE/xpDGwek24dAxQjgI9ftjpxsS8a/bELqapR6tAj
	muwkUOMnAoCiCCzc9N3gyIyjBQ028ekZkYnZjSeXGig4Uq/bzZEBntB3
X-Gm-Gg: ASbGncs+Bz8ag6xUaOIqoQ1NQDUYZMlYHfcbhTJeaZs8wd+RIiMdaqsnwueijJ94kpc
	qLPCI8VpmAOtF1I++O/Vz7q1sqd1HXn8IBqoiMprh3Sdy5n+I6Jx3EHFebu7r+rP+8gvns1llXA
	c7Qz2xIgsWwpEAumSENthjqPFAElra9PetDJjwtRVVhzgVBrN1x+/uyRTUeFZp7GV6Fw6asJD6H
	0eKndqf3ImifKrjFXLTKaSkOcc7YOKbgBuEkCGuMEGZuz5haNvIgUtY2/6h+fmnbYmOZ4BUgTFb
	kYu7aiekDcZWoF8+WQhTXe7KbZTlISKImm2PyNr/5uz8iTwSgfbtq1CDkA2LAzVGNPPihZf421S
	AOswYsAlDQ9DQsTDSdvFpSaJxlPE1nEplBzJFx4LEZIAP8N1lmC6rjsvmGDSm3VPWDtbJ
X-Google-Smtp-Source: AGHT+IETniAu5RF23DXJl4RTeUmT+jz72oj/4aPrk1D9mhpfpOOTuJt3CBKA7KYp+BQekuHfY5Km0A==
X-Received: by 2002:a05:6a20:12cc:b0:2ff:3752:8375 with SMTP id adf61e73a8af0-32da845f843mr9302925637.45.1759999448580;
        Thu, 09 Oct 2025 01:44:08 -0700 (PDT)
Received: from MRSPARKLE.localdomain ([206.83.103.239])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-794e06fb374sm2141633b3a.56.2025.10.09.01.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 01:44:08 -0700 (PDT)
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
Subject: [PATCH 4/4] dt-bindings: led: add virtual LED bindings
Date: Thu,  9 Oct 2025 21:43:39 +1300
Message-ID: <20251009084339.1586319-4-professorjonny98@gmail.com>
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

Add device tree binding for virtual LED groups.=0D
=0D
Co-developed-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>=0D
Signed-off-by: Jonathan Brophy <professor_jonny@hotmail.com>=0D
---=0D
 include/dt-bindings/leds/common.h | 4 ++++=0D
 1 file changed, 4 insertions(+)=0D
=0D
diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/c=
ommon.h=0D
index 4f017bea0123..39c34d585a47 100644=0D
--- a/include/dt-bindings/leds/common.h=0D
+++ b/include/dt-bindings/leds/common.h=0D
@@ -63,6 +63,10 @@=0D
      "lp5523:{r,g,b}" (Nokia N900) */=0D
 #define LED_FUNCTION_STATUS "status"=0D
=0D
+/* Virtual system LEDs Used for virtual LED groups, multifunction RGB=0D
+	 indicators or status LEDs that reflect complex system states */=0D
+#define LED_FUNCTION_VIRTUAL_STATUS "virtual-status"=0D
+=0D
 #define LED_FUNCTION_MICMUTE "micmute"=0D
 #define LED_FUNCTION_MUTE "mute"=0D
=0D
--=0D
2.43.0=0D

