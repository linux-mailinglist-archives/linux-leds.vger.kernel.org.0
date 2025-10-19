Return-Path: <linux-leds+bounces-5819-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59200BEE6FE
	for <lists+linux-leds@lfdr.de>; Sun, 19 Oct 2025 16:24:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79F46420E34
	for <lists+linux-leds@lfdr.de>; Sun, 19 Oct 2025 14:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C0A42EACFF;
	Sun, 19 Oct 2025 14:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dkzaMCYJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598422EACE9
	for <linux-leds@vger.kernel.org>; Sun, 19 Oct 2025 14:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760883884; cv=none; b=DIBDcTPAobxyRiJ2wCcQKNsil9x1rF4odLHAdFmBsGwSV+QGplMLotEvfoDVLIvBOkdBlgxeFC986Isn3YOJk3Lt8xAKgE43kr100Fkrym2YBv6Xo8zYNpAwd4ACzJLzoDaEiEez+wQ9DBpO3+YJb5iEHH9CYBCsDLjPvwRHMmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760883884; c=relaxed/simple;
	bh=UBQ3CI2i/Vqkyp+P3nK/BsPqKNSMijENxAcB6e9vYzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n8WVMlCxRZ00MgVpghwFK2Ydb/QI2q4XaHcUTJhqAL3MswuqOCRFkKUROc4i2KVtbLUyiPXaZb1VUu2inv/RAW19thNeogkwpdXgwR9AGJ3zxvxh+2B5iS3lGRfXmGOkcqdS3Z467tjynsoN27z/Qv99FckLOhpcI5o0AYI0e2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dkzaMCYJ; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-57da66e0dc9so3546408e87.0
        for <linux-leds@vger.kernel.org>; Sun, 19 Oct 2025 07:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760883880; x=1761488680; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Rk93k1ljwyghSN33Atl9hvNPZmj6zeAwyQjoSPxOYU=;
        b=dkzaMCYJ7ykWAh7f5a0/7HfC1AWJ55LZAq99M1IqhKOY2u+OI2tN+Op0w99GNPhC2b
         ky6PjFGrMTHI8sDYu7egnFgOX9VRWCjJix7L47Q0F/YaGZvo/drHryjsuR3QLMk6Uf+g
         iud7kC8UatVGjq43T6G6EMZUwhS5JJdB8oFp6tcyqNxTqBjv1mvd4uYVKCQmbeOwJNUE
         K3pZpA1hDdwL5W630R9Qe1fos2Z6QcyQE59xzWLfgpkNRvYsC9DZzXzE7Cbybj827o6/
         LYA9GOUTxdMgtLHIjFFXP2y87e61M0+AdTEBm9eaV3n/2gEsCExcT6kyrzCddiPQpR12
         qpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760883880; x=1761488680;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Rk93k1ljwyghSN33Atl9hvNPZmj6zeAwyQjoSPxOYU=;
        b=fVwc10IITJDkRWZ+d5FQReZuQnePBeVqq9DgCjBh7Vw2ZKtT8eqJ/zpXGOaAEVGxB/
         UNRssup+BsktlvPrMPVTN0Z7oYCc78ZTHp6/N3km0jU3K2zi3rAlzQGmGU4mgA6h5FWM
         iD1bcCBEbZaC4bx1l/7futV+rFOkS0EFlfLRH16gps1csig5YedKmSXSnzBIC/kPSWjO
         qf3eqVsd6CTPVsxfIbEt8MvgqKIXuZn5ro3sAgCqnUO/5oy619zT3os7lKmCWUACJ6Y3
         IWrdqHmcEzy+oHHQg9uWrGePUUq95P9TmZ0PopvUFw3RlsL6HzjiEULcDiB98akIDUME
         apJg==
X-Forwarded-Encrypted: i=1; AJvYcCUJPil4pQZqTv2zRoQCFHcI+Hs99HxTQ+j5hUuhKFb0PE2ssft/KoCWt46qvaNQZsCSHSeJ6xtCjkOA@vger.kernel.org
X-Gm-Message-State: AOJu0YyjQ21R3Yi/qbcL+Yfu/EvurSX9YmP5FATq4LWoWGrOZ7TXajyX
	mKKmuEs+9m2IuY/dpl2XBER996VIsbpLN8TB10NSTQWbwWgpS8RVuJg5
X-Gm-Gg: ASbGncvnCsAVbG9dTRJhyi7sUn54HhotS2EeqmWPjiLhZJD7ZpJ99iV0g+ra7BEbxIB
	o7HfQgdWvMoTmMXLJc5H+ooPQxPs5BcLXUC6gj4pXp093O2F140pVEtnD5FlKtKwHbXeIhrczGL
	sflAXL3UB8bbomOzN7LY7Lg3Jp/1ldwzOcB7STZ27ya6gVCakJAK1qSTFYsd3tiU18qGl/2gc25
	hOIr3XK9GNMDWQPhx044STj1TcDONDIl7EcRuEL0UQGIAS+SwdqBvw/itPYEOUArIfs+qxdc98S
	XZvyjtTdft+YVK4Ek7mTpRRqnuAH/PS2b97qsSQAHHlcVUQAsOBT+ilCHZzg04QZCNFgOmzlv0Y
	asBKvWpT1mSWSUQaGVbzx/IXxFaihlQvwkGnCeFPCVKN1drB37V3WaiFRwISfWx2ocpZR0PpRfp
	dIexx3js273Ux5
X-Google-Smtp-Source: AGHT+IH2ftzTuRheyla/6S9FsuGwyDIul5Lq8UOJqEvJlweJ2mNm9Rk7iuIHqgSTe76z8e1m61a0kA==
X-Received: by 2002:a05:6512:1188:b0:580:dda2:5318 with SMTP id 2adb3069b0e04-591d8533db7mr3421013e87.8.1760883880143;
        Sun, 19 Oct 2025 07:24:40 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591deec0944sm1591331e87.36.2025.10.19.07.24.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Oct 2025 07:24:39 -0700 (PDT)
Message-ID: <3df51774-9774-40e6-ae65-7621bdce0f91@gmail.com>
Date: Sun, 19 Oct 2025 16:24:38 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] leds: Add a virtual LED driver for groups of
To: Jonathan Brophy <professorjonny98@gmail.com>, lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>,
 Jonathan Brophy <professor_jonny@hotmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org
References: <20251019092331.49531-1-professorjonny98@gmail.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20251019092331.49531-1-professorjonny98@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jonathan,

On 10/19/25 11:23, Jonathan Brophy wrote:
> From: Jonathan Brophy <professor_jonny@hotmail.com>
> 
> Introduce a new driver that implements virtual LED groups,
> aggregating multiple monochromatic LEDs into virtual groups and providing
> priority-based control for concurrent state management.

Aren't you trying to reinvent LED trigger mechanism?

-- 
Best regards,
Jacek Anaszewski


