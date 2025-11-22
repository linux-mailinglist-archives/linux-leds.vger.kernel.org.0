Return-Path: <linux-leds+bounces-6280-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A6FC7D4E6
	for <lists+linux-leds@lfdr.de>; Sat, 22 Nov 2025 18:45:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE90D3AA237
	for <lists+linux-leds@lfdr.de>; Sat, 22 Nov 2025 17:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A33F2609FD;
	Sat, 22 Nov 2025 17:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BC6y5zpH"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507B327FD76
	for <linux-leds@vger.kernel.org>; Sat, 22 Nov 2025 17:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763833503; cv=none; b=r43UtWo1i3k2nFxhJE937Ha0c26n66M3c5iTT3XPXgXHjU/mzMVMo9Bxgklg2re+B9lYSBwRUpNdygin3i9bCeBWwa3w2TDXkeKV6mOZSBBXpwkYOc0XmsvWUJ0IgSxLpETG+cF1XQkR2g2zev+iFY4tN8Ix95MPbOlsg3TiXoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763833503; c=relaxed/simple;
	bh=hgq5szZw1cJQ6Pay5skWEdtBmkCCIRg1Ew30CGIykR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gJIXu1L9xJo5Zcvkx2lO8oRwJE8h6rcOFMvixUSOi1YbF0/vyJZ343wKKA6Cp9zwZDrEwrLSFEqZKoaD4f3QMHqVEMniKLK6khShpcq76w5AI32Vv0venh0kdToFz4XNo7nnolevVU8mJET9pSa3eDZJ3O9D1ZGAveYFV7+Jyi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BC6y5zpH; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59584301f0cso3258646e87.0
        for <linux-leds@vger.kernel.org>; Sat, 22 Nov 2025 09:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763833498; x=1764438298; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sK2kUfLFdnAIPOfoUdBAt1ROupy0YOwlhfQRrIOHuz8=;
        b=BC6y5zpHqYSq+3JiOePT7fImpfyvyty5q005NKqHWdApdVYJNq8c0U25oSN/Y9bb/W
         mpWB7TpfZV5nwcZmc1HmFnCF4d9rv8MORNUp79KE2dFqwW16Q+Orb65spvVmXfKBT+Dp
         4H5SbuiJ9YHLiRzEFLJA3ZUSIxtJaK/j0M1nt0v7Ojkkb6XQ4W3YnmQJR7atHOcCyXI7
         SRWmmPh5XrTmNp4jGl0R9otYmiA0AfC3pEcEBz9igwSJWO67mfaqBo/O5bMSb1UyjJ7H
         cW0xllFsmtHRiDLBDD7Anmx3Ff3s0GVARoX55xo+0v0LqkhAIpYhpCXnjV2ubhoj35TJ
         BoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763833498; x=1764438298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sK2kUfLFdnAIPOfoUdBAt1ROupy0YOwlhfQRrIOHuz8=;
        b=CkO6ek/NXi75dZS6llRXbIggp+4Z9K+QCmJoRLQh/5ntC2in0E3fZFrXDcxqVoR41x
         etLx+szxDxTEnbFRFDTiZrDQ7Stw8nuBxmEn0PxzHL4wJCoaWDIP0wkRg/keJgapiHge
         wve3d0nzM5v2tPmyRtboNrF8hGiiDeR/IKxJmxe+8ClzxVezMQCDgN0NJwBOXej58dMd
         CmBFfpUn0AFs4O3pJ4jywbMc+YCkZqRKDSGbEgyKwy6U1q13z53+Flwq6l8AXVMGdxnA
         ns0BAWKk+vakbe9d6ZcipWTtASU1TAhnGzsm1e5dLvmq5Ie7tpzSEqZSO/yIbq88DU7l
         08UA==
X-Forwarded-Encrypted: i=1; AJvYcCWTlkLThXTvY+NY9Re9enlxAYSMTvmCHWDir3toXN37ku+7EKIb9XLy7Zlx2OaaB24yl3r6h0PXPVZX@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxm68q6aTAgj6vlb0qt80IYXBJnYcMoDQAqyEncIMjMBpOQ440
	WZAIly7NGHzzL+PgLKLfWRFQYosFvIfTfurChrnI1R12B7J2vmc/G9px
X-Gm-Gg: ASbGncuaES6sMdEJs1IWzX4T+HRnSC2MN2yahWeeCfHbMH2COv7AICja/L1FadqUdz3
	ty3QIq1hizWq8qiatyfWiQEN5zHlS8dobQCFDKT6P0kaOSTE/sF9VHg45gZlIh/FMvtZh5ubk3S
	pSOaFGhsd3Hc+z/ADvwlzLx7HHef393Kn5WmB9Xms8DgUGYjtQ/fYjsDtkcK5aogzz3+8hSSQQo
	6v0zpEaXoZC6hnAW98zri85Fu8l4PYLa9L1Mlr07KfGDmslCLywosfperwdfUDZ9VkdSr8nz33M
	6qsZoIVheyjjm6vDB6W23RgYtln/CV30dAT/hdka+yw6E/9eKD+9a5dbxsCq4wNyuSlgfq27sfI
	ePPH2SsnlQV3+bKYhB0yrRj98QX0oT5ZxZc+7zGP6uEpghFUB2Npb/oHsy1NUTV3OLw8SK9NCxn
	1dONSKB80KJbpE655q9h/JNAM=
X-Google-Smtp-Source: AGHT+IEPmZ/ql8yWquej3EfMZ1YkbDrP2BJ1nc5Ebqoks1N3idwLrOnLQ4i2cbgU3+oONurcV1tlCQ==
X-Received: by 2002:a05:6512:3185:b0:595:7d95:eacd with SMTP id 2adb3069b0e04-596a3e9ebb5mr2220711e87.8.1763833498193;
        Sat, 22 Nov 2025 09:44:58 -0800 (PST)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db8d967sm2596677e87.43.2025.11.22.09.44.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Nov 2025 09:44:57 -0800 (PST)
Message-ID: <ac2fc24f-e554-44df-9c28-00ac12d41af4@gmail.com>
Date: Sat, 22 Nov 2025 18:44:56 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] leds: add support for TI LP5860 LED driver chip
To: Lee Jones <lee@kernel.org>, Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Steffen Trumtrar <kernel@pengutronix.de>,
 Pavel Machek <pavel@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251110-v6-14-topic-ti-lp5860-v5-0-5b777b99a905@pengutronix.de>
 <20251110-v6-14-topic-ti-lp5860-v5-2-5b777b99a905@pengutronix.de>
 <20251119153627.GT1949330@google.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20251119153627.GT1949330@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/25 16:36, Lee Jones wrote:
> You left Jacek from the recipients list, despite receiving some good advice.

If we're dropping grouping then I don't have other issues than pointed
out by you.

-- 
Best regards,
Jacek Anaszewski

