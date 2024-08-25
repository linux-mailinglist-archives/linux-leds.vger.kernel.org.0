Return-Path: <linux-leds+bounces-2522-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA6995E0FA
	for <lists+linux-leds@lfdr.de>; Sun, 25 Aug 2024 05:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73377B21432
	for <lists+linux-leds@lfdr.de>; Sun, 25 Aug 2024 03:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BF9A8C06;
	Sun, 25 Aug 2024 03:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ebUubxVJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08C6B667;
	Sun, 25 Aug 2024 03:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724558050; cv=none; b=i1Pwx+SAiRzGqXV27EsxUKwKjDhNcbLoQ0p0SIKQs6fHcd4dF9+HEAe12RGYQDxW5e8/ApSAyeT9HODJm46b8JgYVEuIwNFa50cvwm8E9mgcGlmOMo32VJC7JvQxnSY3AwljigG8fKF7apwNL++aYs05syf0kCzU6ZYsVX8t3W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724558050; c=relaxed/simple;
	bh=okJ2hCt5aTJgDcUNU44pAdnsRODyqx1Z0qzyZr0eCUs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Eai562mdq1zIpMyIKc5k8julZFuiBEvhPxdUFpyjcPFaYfindjgS6NENZb3id17icrHtfQwNyLXoYZEvI+yHD1cojI2uQe+yu2dZ+8HUIOMaexI6sLydbhH4e2UDhyUzRs1Fo4HH7FaWW2piVn7zByXcQQ+pPuPp12psx6EonA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ebUubxVJ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20203988f37so31728405ad.1;
        Sat, 24 Aug 2024 20:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724558048; x=1725162848; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bEKwLaZ8eX+2F+2ojEc0idJO4EKoYFoaC5mzt/EJ/Hk=;
        b=ebUubxVJ8C0xfx+5hIcCnuhoYQu+hIVgS1/eLHUsVwCRaRfpqVhPzL9GMyJX+yBaJp
         X/Vxl/12DMswfl7tiTNoEj95eyot3ONRHo2UgKrgD0oA+fIg+kkNZsol8xGfZDItzhIe
         F//cyxklW6kFo26NJPuF6jzAOBH5DICxntDD9omM8D/iS369vAxyXpwTrwrDO70yQRFM
         4AYF1Wldfk2v1d7nqPUTqu/k8eOQZU6gBrm0PPgErwaLKBRm5yGmRnLog3N2zUsMrsib
         HtHtw5Ich1CsQgW9Cswx0ps+9HOwpTosy453YvmZemMp0YSwmLffRJP0+CnaZ4tryCpR
         YI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724558048; x=1725162848;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bEKwLaZ8eX+2F+2ojEc0idJO4EKoYFoaC5mzt/EJ/Hk=;
        b=YLNVwmZzOY248LSs5H3J3lALQGSnkck2//q7twqclHmPXduf/kJeeSSj+64/N2Jecs
         EJ5gjk9HalGVwNIRmZAG0lib31rs64/nbeCnOrh3yOWiOPs6Svbq4FJ47VUedLXlZsjT
         SKfwsN6Uek3HZzluid4411BwKGprjelWcLpGNloGKYi5c+GtV66py6pjXCxLfz2h/Ato
         tbr7SfQatT4P42cvM960Fa34k41mKAsi316FlsSYSIf6bz7FkNlCv8aD6Wl+b6twXKsi
         6jQO+TppUEkOVNn2zwSyn1pMcy0XY0ibdxkEARlHQontEAs9IcYAFT2sbQZtp9kUjPSY
         ZTOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgZ+utlSFqLWpd05NsTs8WNQBApqr/33F/m0YHyESxHoToSGFduOAKtLJCdWWEsu5/Kz08U/YWCwLoeA==@vger.kernel.org, AJvYcCW5BhqNLV+CCIfWxFZxuf5Chv2kdldftZqgdcnMD+aTqQaqhGIL68a/acgP66QteBXFRZIBebNHP/Q=@vger.kernel.org, AJvYcCXTy3c4j+EBUJly6Bd3w/UXQx1mc8MMMpIxpZV+HWozqkU1hQctK1OPKOc1eMkNBcI/TSSo+d+7Q1OePCse@vger.kernel.org
X-Gm-Message-State: AOJu0YyV4m9z2wWz0wmeEzYhIAQAR0pTR6GTwE5g4ItZe3+p+Y036+2n
	cNrtHgf/VBx/H9vVkL8ThjhgPs2voUh90Fwc/CgyRmQyKOW9JRZM
X-Google-Smtp-Source: AGHT+IH87DrnE50Q4Lcvaxpezm44zwafI4NmnxTd+2z0GBPruvMFo+HdishWtazpN/w1WMpGkBP2jQ==
X-Received: by 2002:a17:902:da8d:b0:1ff:393d:5e56 with SMTP id d9443c01a7336-2039e4cab1emr80348865ad.36.1724558048058;
        Sat, 24 Aug 2024 20:54:08 -0700 (PDT)
Received: from localhost ([115.96.30.187])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203859f0115sm48430965ad.242.2024.08.24.20.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 20:54:07 -0700 (PDT)
Date: Sun, 25 Aug 2024 09:20:39 +0530
From: Aryabhatta Dey <aryabhattadey35@gmail.com>
To: vadimp@nvidia.com, pavel@ucw.cz, lee@kernel.org, corbet@lwn.net, 
	linux-leds@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] docs: leds: fix typo in Documentation/leds/leds-mlxcpld.rst
Message-ID: <5nib2kj6uh7lkafrmmwcjpeyvs7megdfmseftkjws2wcuztoyc@yhidnl4ilbok>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Change 'cylce' to 'cycle'.

Signed-off-by: Aryabhatta Dey <aryabhattadey35@gmail.com>
---
 Documentation/leds/leds-mlxcpld.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/leds/leds-mlxcpld.rst b/Documentation/leds/leds-mlxcpld.rst
index 528582429e0b..c520a134d91e 100644
--- a/Documentation/leds/leds-mlxcpld.rst
+++ b/Documentation/leds/leds-mlxcpld.rst
@@ -115,4 +115,4 @@ Driver provides the following LEDs for the system "msn2100":
 	- [1,1,1,1] = Blue blink 6Hz
 
 Driver supports HW blinking at 3Hz and 6Hz frequency (50% duty cycle).
-For 3Hz duty cylce is about 167 msec, for 6Hz is about 83 msec.
+For 3Hz duty cycle is about 167 msec, for 6Hz is about 83 msec.
-- 
2.46.0


