Return-Path: <linux-leds+bounces-5086-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF92B09019
	for <lists+linux-leds@lfdr.de>; Thu, 17 Jul 2025 17:02:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 616FE7B49F2
	for <lists+linux-leds@lfdr.de>; Thu, 17 Jul 2025 15:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C36D298CA3;
	Thu, 17 Jul 2025 15:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="RUEDBde+"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0282F6FA9
	for <linux-leds@vger.kernel.org>; Thu, 17 Jul 2025 15:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752764540; cv=none; b=QCZ39NKP4rCQjPJ+6B/xdl5gyBvoJe0u/jCR/5qpvGI7ll+CagpRlkPlqi/wgTwrIorxopH5OVIqalwX67m8NrpsKUgPWZyTzZQFU9t920h8Gevo7eq9mZcUjmMhO+FpTP0bXuTteL8MrK7hYYgnBWpEhxkMHpS7sNFcE7XnYbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752764540; c=relaxed/simple;
	bh=llBy/b7Qa/FAAMcEoMOnFkQjPXbckRY7mUt4vQyY1Ak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SMjgH0JZol+Acy9HcixTnPz8vG/XZz6Rqm2cyOpGXJVwr6C94jpaqFZmsbmDO9KTB8p3s0oWVTuRLQjTLA1B/0x1miGUUo+k4u8lf1197avNps+YKoBjx3J4pCOFm7Q+a57or4SowRmEV91iOuS45nYq+aIlsnotX20yYt7gPAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=RUEDBde+; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45555e3317aso6702305e9.3
        for <linux-leds@vger.kernel.org>; Thu, 17 Jul 2025 08:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1752764537; x=1753369337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sNJrEl0O7bRpLpSsIpKxQcUH18AWQLtF460aSt/ftcA=;
        b=RUEDBde+47oQyjH0j/iT0oIXjkq8L48QbYUGdndi28+lnRBKUOKzldrymcU/LbZcIz
         3i3zXmVGvCLnwjMFB9g+qmCLihd8/+nI3WtF0/IuYjWykewreIdmKoK96rdl80lZ8Y1f
         cwwt5gYQF1cD6LUrBmYbgUaLnF7I+O59bRD0FqUpd8AHR6ysrcJuKqP3+okYsfDcOD1h
         UphGjj1bNFtFMlyd8cy0eVwp8Vl3SfQxyQDMnphABH8+dpMVJutABqyFThllsgxl91h4
         nvU/1WIENDQhARQ1IhQOLg5Qacj+JC4S46+gETJ9FPlngLQXcWtucob48TGFbASSDe0R
         ukXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752764537; x=1753369337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sNJrEl0O7bRpLpSsIpKxQcUH18AWQLtF460aSt/ftcA=;
        b=O66g5oxeGOv+VneNS9WAuMdixgd50evFb+VNfOpPk1ttF7rVumdT/fgdX1yKTjjZpB
         9CR2f/4MJaK9forvjzKIrEOHUAHTdnM9/RgtR3xe/zEdZ+MeCKIK/bKgu7eg0TFoyMTL
         NXbuoDeT3qsDoUUIpEK6gtq3xXhln4cFFLpQwt+xU4GnpVDXabg588XFKA4SiNhhD3hq
         aVTRN979sNiBL6EwzBVFsTYo1rYcB6CBBxHcb4z1SFCbKCx3oZXap6+B+NKvRRBpd426
         lGLGjAWkfQIo27oVQVqIDcbKE8ZoKbAHowPOyh+tMzM+khF+O2D0zqiXKp5rCR9RjvZr
         diHQ==
X-Gm-Message-State: AOJu0YzFtLvip5CcdK6Y8dTclRWrFhnZJO5ac9yKtsvxZUr3ml0Bzqio
	tT69hy81zcKrJEOrUB9U2SwYDGfDcxCMywXyuaIbNK7FQeFZhdEuAWZ6ekTLy/M0JJw=
X-Gm-Gg: ASbGnctqlAANbT9AYQhCCU7nkJor9YmhT4XcKxfFmV2WC4LY/Lr5YYfmJICjrOBUy8f
	SqqtRhx7dfR7D/sxcp3ggUf115rexq6m99f463SggA3gDeij1ZaRoiu8V3/zH73HN9Awhu7yK8O
	V5xdTE7FPulH/FPxBlQ6TiF5ZGIy4I+rr37zUaXCw+YdVtZkc4F/QPmAxcm8PQlvkTNpfUl3yYq
	3rb1WbfEfvToZsXGyyhl/uye5DU+Stp/lUs47julnd41VpmkKzDfrnaqOtcnFanrJ2ntVx4Wadq
	IMZhyH9h8H+DXckrGsnhQLxIpzjEiLIzmleDc6WNcEYYRN4q2Tib67/gAr80XFSxtzrFmUQYHL0
	iOijQd/1hgzgo5YLTa88EKPMXNVSInL5Uhv5xwh7zom61rTuKAA==
X-Google-Smtp-Source: AGHT+IHgNHS/o6onGmsdDfpqQpu068SqkxhZQat/9gA9e8qJKESPJAAsVTAkOqGfNFHJazeHZ3iaTw==
X-Received: by 2002:a05:6000:18a1:b0:3a4:dc93:1e87 with SMTP id ffacd0b85a97d-3b60e4d1aa3mr4787708f8f.1.1752764536545;
        Thu, 17 Jul 2025 08:02:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c7:1d1a:9c01:ebc8:7ccb:ef04:4f83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45634f5cb9bsm25321885e9.10.2025.07.17.08.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 08:02:16 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Thu, 17 Jul 2025 16:02:08 +0100
Subject: [PATCH v4 2/3] dt-bindings: leds: issi,is31fl3236: add
 issi,22kHz-pwm property
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-leds-is31fl3236a-v4-2-72ef946bfbc8@thegoodpenguin.co.uk>
References: <20250717-leds-is31fl3236a-v4-0-72ef946bfbc8@thegoodpenguin.co.uk>
In-Reply-To: <20250717-leds-is31fl3236a-v4-0-72ef946bfbc8@thegoodpenguin.co.uk>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752764533; l=1105;
 i=pzalewski@thegoodpenguin.co.uk; s=20250625; h=from:subject:message-id;
 bh=llBy/b7Qa/FAAMcEoMOnFkQjPXbckRY7mUt4vQyY1Ak=;
 b=3xGj2IvSWBD8KRt8TspczyjKTTUc/IC++kZy+CcUPagHRuWzBxlsqHuisz0tUS3CtocoXt+Mz
 jwbuRyAT6leDEopMa9dwD5VbEPi7fxlmZLXiH5NI5HOD9Gz99kd2cKp
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=hHrwBom/yjrVTqpEvKpVXLYfxr6nqBNP16RkQopIRrI=

Add an additional and optional control property for setting
the output PWM frequency to 22kHz. The default is 3kHz and
this option puts the operational frequency outside of the
audible range.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 Documentation/devicetree/bindings/leds/issi,is31fl3236.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/issi,is31fl3236.yaml b/Documentation/devicetree/bindings/leds/issi,is31fl3236.yaml
index abcd4c448e94db1d1e339f7ee165c3e04a1d354d..e75809e343b110eed0fd5f87065d8e94a97835fa 100644
--- a/Documentation/devicetree/bindings/leds/issi,is31fl3236.yaml
+++ b/Documentation/devicetree/bindings/leds/issi,is31fl3236.yaml
@@ -42,6 +42,12 @@ properties:
   "#size-cells":
     const: 0
 
+  issi,22kHz-pwm:
+    type: boolean
+    description:
+      When present, the chip's PWM will operate at ~22kHz as opposed
+      to ~3kHz to move the operating frequency out of the audible range.
+
 patternProperties:
   "^led@[1-9a-f][0-9a-f]$":
     type: object

-- 
2.48.1


