Return-Path: <linux-leds+bounces-5485-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 428C3B51E91
	for <lists+linux-leds@lfdr.de>; Wed, 10 Sep 2025 19:07:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0769456185B
	for <lists+linux-leds@lfdr.de>; Wed, 10 Sep 2025 17:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0BE62D24AC;
	Wed, 10 Sep 2025 17:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="rhkC4LkV"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C05928A73F
	for <linux-leds@vger.kernel.org>; Wed, 10 Sep 2025 17:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757524051; cv=none; b=JqrHe0Y/f+LJRFUdWZOku6Tdkxhjs1u83avuCZhD/AVgtG5Yw1KrI5/+IzB0xbtd031Ic2uk55+Z6SaSojcDiDtpSBfgDu2WNZphUf1Su+yoc5iB/p1OVVJU4oGcqWBfPRYSw9c4JeffGh84XObgZf8HnT3dwuUMX7cq8osbFcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757524051; c=relaxed/simple;
	bh=N4gPPS/3dSviDV+nJ9aMHOkSB0mRiMcb3pe0ijxcYPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pnZo28wmnZV+UZJiuyK/OV3SuPO+o4XHVmB9WBe00YnjWRS+IgKYWqM0wwQWX1+tSFrGYB1n+qqKqvF5+4RaM/9CYHdv6/zkc8z5eseZ4lGpRBc/KQKsr3RIEAFWKBvSMjqVNEJydvTfAG4di4tUFD1CIzYDNw3nGxMcWeEddVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=rhkC4LkV; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45df656889cso10894245e9.1
        for <linux-leds@vger.kernel.org>; Wed, 10 Sep 2025 10:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1757524048; x=1758128848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gekjhcGuFAvCdvKdCIZQrxRikZ2Ctx9B6SPOTCwdqxo=;
        b=rhkC4LkV9HgSetgiQBBzpRSSpgSYZRb8GKm4It+rCmJMSWa0PpFISTr4dLKqlm6Xix
         HVp43ELa8ujo4gi3CNfEUdrPr+T/nwyKXGCJYqT8peaXgsKGnhRc0Jgiv54TKhAmK/0x
         bIi3ayuNEoIiQchKnFjzvLgdBeoQkp3BAN5iqner4Yjx7QQVFhZOD313LCcOOUSl/gE/
         0xE+9J0ItcTgn0ArHXRTmG7FKPEpaMOjfr9FxKAvr5NdJF3TdpAu6gh4pSlvWAtv9Wnf
         Y03MzoALIRhpDWpgzC9zmODMVQMI6z4Figwx71tgZYaklgDpkICVxIFJNY+Kt3HDdNBL
         I8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757524048; x=1758128848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gekjhcGuFAvCdvKdCIZQrxRikZ2Ctx9B6SPOTCwdqxo=;
        b=IYcMIPKYPGjau59+KmupOZi8+rlVHasbzI2Fxb5N1j/Qtz7pKV4zZIV98P4zs5aZp8
         xdAUCv3hJNO3GutdiXbPCrxiR4O36u8SYp7DPunkG/rgroD+od8fSg8GF/JT7CXk6Uaa
         1qUVr0KLZZ58Y1SO9K/Cha8kXqa8/kKMcvOgr7OS+80Evvl5/2FzUkaLQsGJNJqjU/KV
         /CCjnhGIRS5vLsc4LbNEOmCtJs96zX+9z3N0ij6mb5kEIvtY/zkIG13M5QkVc++i7h6+
         SzEcL8Y3hX0EZBZ+wRx7Iu/ZRDN4DGUU5Qeue50v8ydrTEdAIOLz/xYrGPftbtC3SJo0
         zGsg==
X-Forwarded-Encrypted: i=1; AJvYcCViGJF2NQYJcLJx8VVgg0QS3bt/FYfIdruUkNcZgqcq/Y/KBIKixaTJY9C8/cuLW58ehWwjmLRGJgm3@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1a+4Yd5khzyIadX492onyKBiWJfOxiy+skYJTsztjf8a1H+LM
	o4vsupBosEdjM8eM7ORzBfSoWpW+86iynnwC31V6gFZhN0hnNcfwd719Yz+gEEbdYJc=
X-Gm-Gg: ASbGncs7vhCeab+A764q3tH3BvXERmvbjm1HdmkJlQsc7OwJZLqR/lGFhSXrat0n10J
	vPJjAd5hGdB+fYHiuk4rhUTLB57AcPKXu38tTtx1eLwuKoDQE9qNbqVVkjqktq+5CTVqshXBWEY
	wQ+QVJuqa7c4xv3hlewE64eDorxXKbjRHi0gikW9ohA+4Jtze4UfYoNQeKI/aR/fHfU6PBS6wbp
	wJxJIYKz/S6KmAnv5cmLSguQarPY9iAQL4e4cp5N2sEKu5huqT1+DuqS+QnZBPVvkchpo3PrPwI
	+CptRuagXSDd5L1yqGT+ZZRtQxz3fzY3xc29cu3SO440WpC2MO6E8OuvIbRJqU1/KUzmkuo3m68
	8j614e/MzcP9QT0xj0akYD3ZTA+3bgEV2BA69L2aQ
X-Google-Smtp-Source: AGHT+IE8ICbq+Y0pNELl5MS1Ijotr4nvX+Ht9YB0UVmmnGjj1nmt8pLLDUc5Zs7zq66i3nLkc7Fh/g==
X-Received: by 2002:a05:6000:26d2:b0:3df:b9e7:35ba with SMTP id ffacd0b85a97d-3e6440f0674mr13101716f8f.57.1757524048387;
        Wed, 10 Sep 2025 10:07:28 -0700 (PDT)
Received: from hapmop ([2a02:c7c:8a3e:8c00:27ad:58c1:9156:5215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e752238755sm7374432f8f.32.2025.09.10.10.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 10:07:28 -0700 (PDT)
From: Harrison Carter <hcarter@thegoodpenguin.co.uk>
To: robh@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	hcarter@thegoodpenguin.co.uk,
	krzk+dt@kernel.org,
	lee@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	pavel@kernel.org,
	sakari.ailus@linux.intel.com
Subject: 
Date: Wed, 10 Sep 2025 18:07:27 +0100
Message-ID: <20250910170727.548880-1-hcarter@thegoodpenguin.co.uk>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250910150527.GA54174-robh@kernel.org>
References: <20250910150527.GA54174-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Subject: Quick clarification

Hi Rob,

Thanks for looking it over. Just to clarify on your
comments:

1. Is this to stop duplicating things that are clearly 
    described in the variable names?
2. Should I keep the "Must be dvisible by X" parts of the 
    description?

Cheers,

HarryC

