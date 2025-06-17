Return-Path: <linux-leds+bounces-4840-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 513DCADDADA
	for <lists+linux-leds@lfdr.de>; Tue, 17 Jun 2025 19:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02C6917E2E0
	for <lists+linux-leds@lfdr.de>; Tue, 17 Jun 2025 17:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9478B23B625;
	Tue, 17 Jun 2025 17:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UzoIKQgt"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D85155C88;
	Tue, 17 Jun 2025 17:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750182392; cv=none; b=PryxpVmIrUrchyDL0VA1cVYKsG+SVMGjC0ZDkHanav7nvnTMIygTg9ou8XygkDNlbilR985OHQ+cGkFwt6fYcS99aTdve2dAwKQWVSdx+KqlE0ROT1ueN3+uDkPaXz/REkT1RJIjGj06jX2j/ykhSn7hYctzLI2hFxGijIYsNag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750182392; c=relaxed/simple;
	bh=Uv0NCTJ00gk9YV7iyXByPsM1Wt4R014FnhORTMDPaiQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Yit6LLB66WXaTOQetVt1yf9ZA3cmvfAjsdSiFj8sZfP7wLyjpHgCtXTqyZoGb8iHdCXgclI7BMWglECZfQfnhOvMMcURnhmHfPfGKVI5okWKXYicjB/3ICmetp3wRDFjtT4jK+0juKPcGsgDanXEANDbMCw69NzyWDyOJRUuv60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UzoIKQgt; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-73c17c770a7so6814077b3a.2;
        Tue, 17 Jun 2025 10:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750182390; x=1750787190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PhXt6IXHoXRnuldAMrELoIVsG76q2w//unnbq8lMXlY=;
        b=UzoIKQgtcHOt/kqL8VgjiuJBAlAEuiwcu/e+mU5l2w6mQMdh/REA9Wx0VV6tIvWv3s
         i5+9zsHazouBCQpgPhwyQi3wxNmI8K10MrX68Kxovf0LBQNs31Rt3wp4/bzaRxtytWb5
         N47LG5mghGici5vDril82BGeFXyraE4qu/Cc+NvgoarUkEF4mN6vioRz040P1qPrP8in
         FcX90emZkQd48i7iVxzgm+wdzuc0yyk8FUSkDn3LdcekMh1blD+wUeYtUJkuy9wjM8FJ
         cp5S0fVTaL1hPFO8w5T6JJ7KPOMuWTmwaaKOQ9kZ6+vw+xI4l0OjlccQ9llI3hMSCI6x
         sqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750182390; x=1750787190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PhXt6IXHoXRnuldAMrELoIVsG76q2w//unnbq8lMXlY=;
        b=g2M1t3Tlhd1qvQgcUlGqzMD+hudOytYp9dN/GPJULJdBkiCH81ejsQRmRN1u6RMe17
         1tvozVch1nJ/bhYVRzn+h0mQwVWURi0jb2Po74QU0sgIaUw8+XiSGRUNS3qA6qu2TmGg
         1kPimcPj8f3nInwINxMc4U2ZGWi7wce/pWgPqDNJuQ/t3n3iAcWU2y3WaWS1hzkkrVxc
         zSqH9Ttuf/YkqVzr14qQm/uxmRxXyfTYBgXai2XjjcZ5TXKKoMg2D9RWCKYPDMOsAX46
         hBwLltC9o951OabDFbAhdPMZdcsOOyn98YyLKAxM08d70mUv6vTfhQ/ubV/zZjJHVSpW
         LK4w==
X-Forwarded-Encrypted: i=1; AJvYcCUudF88Imx1HR7BOwDSqUKqcZwISYmpJxPRNpBo38h1fdfdm8awKkSsnLtCyXp2v4uH1RrOB1Ofufd2D0mt@vger.kernel.org, AJvYcCVUFuqt8/RGJBrP14rzVb5NxhAbc2hzJKWrJHa/RVnlo7yO/Lu6tntB9y6NnC4KOcWuKZ2NOuYB2JxJ@vger.kernel.org, AJvYcCWGjqk89cHk38iVfEf0ijqMP8WJNQrIQkN7ahIb4WS7Gry2wWunWr23wsEEm9kGMVg8UQna4/xZX6ajoQ==@vger.kernel.org, AJvYcCX0D0HCfGABfZ/vNdoYaBJMNknpjHXM14m1/QVdv107zELbjC1nOsSJ5fHfdAYc/NpS4aT72tlxuf+v@vger.kernel.org
X-Gm-Message-State: AOJu0YwOaGLW7lXVHDch6aWwLEjZotDg9DirQB41VkDIPYgUu4pLsevD
	cRZt/oOudvHJ3ektWAI0Xgcm4x8VMza1jRFnDIMVSHfL19Cb6AsQpqOa
X-Gm-Gg: ASbGncvIgHor9iI8FKwBEmw7IlcllZPn0Hi5JrvxJf7jl6RO917WWaFOto1bcu2BBq3
	5F/SiwqVW3cfCrWEOE4qXjLid2kmo/B4pk+LlfaW+LUvTvlaaIM3/ujbtPO8qZ8ww+Hak6S6j2Y
	SgaBr+ICa+Le8yQG+Ej7tRGv0eWdbIL2P9TTsRMrnzcJ/v6y5+bwkK2OtInuX8MhbQ42zKKbw3S
	6HC3mmgefIWgPRpxB0fe6zLdWNTjd+rU81xVoMmDluj28VdyZle3h/xlWXFYTZImo99iF1K9hzt
	IFlkQE30Gi36acUoeoQpo95hkCTuA8v3ZyjPAVX5fDNNUP2BDOB07mpvFqzfqIDcAbyRCFI5
X-Google-Smtp-Source: AGHT+IGXdP5LGQE7FQKixxHjndNV1PZ/lpzXikzhO/Gij6a0m6KK+esq1r1YMi/c5xyY+4+oT/DgqA==
X-Received: by 2002:a05:6a00:1797:b0:737:678d:fb66 with SMTP id d2e1a72fcca58-7489cdfcb9bmr17988522b3a.5.1750182390121;
        Tue, 17 Jun 2025 10:46:30 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([42.113.163.91])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7489008229fsm9470135b3a.106.2025.06.17.10.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 10:46:29 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: lee@kernel.org
Cc: pavel@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5] test
Date: Wed, 18 Jun 2025 00:46:25 +0700
Message-Id: <20250617174625.32084-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250612100325.GA381401@google.com>
References: <20250612100325.GA381401@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 12 Jun 2025, Lee Jones wrote:

> On Wed, 11 Jun 2025, Nam Tran wrote:
> 
> > ---
> >  drivers/leds/rgb/leds-lp5812.c | 1934 ++++++++++++++++++++++++++++++++
> >  drivers/leds/rgb/leds-lp5812.h |  230 ++++
> >  2 files changed, 2164 insertions(+)
> >  create mode 100644 drivers/leds/rgb/leds-lp5812.c
> >  create mode 100644 drivers/leds/rgb/leds-lp5812.h
> 
> Doh!

Apologies - that patch was sent by mistake and is not part of the series. Please disregard it.
I'll make sure this doesn't happen in the next submission.
Thanks for your understanding.

Best regards,
Nam Tran

