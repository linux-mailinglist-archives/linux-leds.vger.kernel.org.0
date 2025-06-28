Return-Path: <linux-leds+bounces-4912-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A3EAEC8AF
	for <lists+linux-leds@lfdr.de>; Sat, 28 Jun 2025 18:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B06117534C
	for <lists+linux-leds@lfdr.de>; Sat, 28 Jun 2025 16:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66FE2586C2;
	Sat, 28 Jun 2025 16:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W0ucevz0"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6842571DC;
	Sat, 28 Jun 2025 16:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751127542; cv=none; b=nqaPJ0PLPyDK3otCRjSqpccGUAkw99kZ2nmWquX30o6+0m2BjQYZZjkMmu1vTHDchY+nRcAKzRRlB7cMOqVVnMTJq5eZ6o7+UaZZ1QOWx/ZjC63L1VR83rFG5aytwd5eKzVFk6CvBI/xbOTZ5qDYhCuhw5/29E4Mn3FUg/5RkV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751127542; c=relaxed/simple;
	bh=HTqeSsSKky9tN3QC/e3EIkj1leVwea/z1aXXKmDKd2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q/F3hGimekpZKDfpZfDFz8MExTNJkAeYZHAnJxcZQ+WchwBZ0Fd5SyZLP0c9rOjGgV3GBjdXQUSpUsZiNxlu+cQi3ayMJkkE/6Au2f89qLNVoWfjAVu/55XttPZIdpAtLbzpKt7kFbECrfdyYqgtnu1b6jrmGd+6eiPy/k/P9vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W0ucevz0; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6fafaa60889so3541936d6.3;
        Sat, 28 Jun 2025 09:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751127540; x=1751732340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVrl6HRSnPKb1ylhxhE5h77W8zUj8C870Hx3TOMMukA=;
        b=W0ucevz0WAysOKw6Lowy9klNK/gd/XCdwOAu/OL3XSsmrDIFHoG/qDtVmoFvMDYOgb
         d3IuLDP70aLJ/FOXmBW+VIPp4SWkhX99k7wiQGf6/z9jCQJns3FwNj8sOgG4277QdUP0
         j/BzRhPyd06NoXk/aKE2gQXFOjW43xvA2E2PUOoiv9quAiBpsUZM4NjXBg/0qOzT86UN
         04LxroEQ0xAaPzztqY+C6f3WiqiXPSdapevwIzrL4zu8H4bCAue40c7CNpX7oPbOAHN6
         cuf9WVYb3cEvkiUg9em7hwHpW2Bd1rXbIGNY8Qq6xP+lQkl3zUrOgNJqqY+XHwI2rNSf
         jMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751127540; x=1751732340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mVrl6HRSnPKb1ylhxhE5h77W8zUj8C870Hx3TOMMukA=;
        b=Di4xW3Uo++xJLHtqHcsiB9Q10Pa37BXYAMcZTO9VgVjYyWj/43IwFIIYxJoEg1YEEd
         md91kOkiZwB4O0g1HogVJYkKLhUxkyDKMsVrGbQjl4sug41brtA/EEbFaoV4PujcL8an
         +6gMYhDlR9RMO+0c6bIwMbGZPTFOpfvVIPcBNAmUwlh0yZxWXnitVnCsBvbDSvpLjWfP
         DXPMyZQmEQnAZYzC6lz3csXystm1B2BBAL0XhdbYBo5RCTm/XueHk5UEsiznR0KCcxTD
         dlRTQzBKm3oBF7miMz1Le0Z9JDIyraNTkLLS/JumrO9j3IMTxsMQcACgmwRpkcHBoGgW
         4BkA==
X-Forwarded-Encrypted: i=1; AJvYcCVxWcny411OvGkkFPq8RIwsp4WX5BEKrxio3WqbnoAHX1xw39GsGNld57Lgz/8fCVIBhzmd77U0HKqaww==@vger.kernel.org, AJvYcCWjcvPBsNnTIWBc4sv+TRC3V+uBzMyYNZZm+L7fbbKdxEdQpqxqq/N/9u+98rYfQF83QGHqQZ7OrmJv@vger.kernel.org, AJvYcCX2izANstYpas0xt5LYsb9LuNEdGPaBODGkQtaRlYUX02Pg8njgYGocjT1b24Q+JSqEOAFLP5gFR5V4/1i5@vger.kernel.org
X-Gm-Message-State: AOJu0YyWFnKSH8UGH6OTg4Mjq5gaTf4zs11qEkUKHhCs61NZrz/LeU5W
	cIOqW3lS7fY7wkH5EVCMbOFhurN0SXHqjUBqi6zzwo3HdM5L0yCcwe+O8M0FYhHh
X-Gm-Gg: ASbGnctd3S/Sp0kv24ShVRPPoSILq7STuS+YvqfxWnix7IhYBHJZBIlfcfJBHMWoFPx
	SGFskJzV6LbtKv/KbLNUUrugXboo2ABDELctF2iOBm7HX4vFkl+b8x3WfcZlAE1xA2ofJMYhWqp
	qr05k40uJOjdmT6SN9zs1xJbDhkJDLp+N9v6OiV1RCPZveyOdteilWjY3RVTIdJoIOceaWlIJT7
	nI628Ws97qopRVThWvJVmrLXPUcMqNSW1PcrOvqlmVsREqSVzogyzexXuqdL0pS9frMmzyL77Ig
	/YZmIvYyEAZyeo4+gDT7UM3bUtg2bdvs8J7ZlrTomgF20zXOHIhyiPb0c2OtcGF2LTSGWTfIYF0
	kgYZ3msoOx9Xqw2Y6nBtg7VQ0ClPKDan0GLtQpj/OkaU=
X-Google-Smtp-Source: AGHT+IEbHAafC0UBe8w9BnAN2DRzSSotCPBt3H1zS19+FYAA0AubG2wMZE8Fhpbe2g262fsd97LE0w==
X-Received: by 2002:a05:6214:d6c:b0:6fd:ace:4cf7 with SMTP id 6a1803df08f44-70001c5ccdcmr99165556d6.24.1751127540115;
        Sat, 28 Jun 2025 09:19:00 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44323ef1csm307238185a.112.2025.06.28.09.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 09:18:59 -0700 (PDT)
From: =?UTF-8?q?Jean-Fran=C3=A7ois=20Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Boris Gjenero <boris.gjenero@gmail.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Paolo Sabatino <paolo.sabatino@gmail.com>
Subject: [PATCH 4/8] dt-bindings: vendor-prefixes: Add Winrise Technology
Date: Sat, 28 Jun 2025 12:18:41 -0400
Message-ID: <20250628161850.38865-5-jefflessard3@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250628161850.38865-1-jefflessard3@gmail.com>
References: <20250628161850.38865-1-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Assign vendor prefix "winrise", matching their domain name.

Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index f03ab02afe..a3bf93e5dc 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1711,6 +1711,8 @@ patternProperties:
     description: Wingtech Technology Co., Ltd.
   "^winlink,.*":
     description: WinLink Co., Ltd
+  "^winrise,.*":
+    description: Shenzhen Winrise Technology Co., Ltd.
   "^winsen,.*":
     description: Winsen Corp.
   "^winstar,.*":
-- 
2.43.0


