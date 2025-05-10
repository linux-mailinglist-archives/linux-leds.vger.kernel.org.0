Return-Path: <linux-leds+bounces-4616-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C9BAB246C
	for <lists+linux-leds@lfdr.de>; Sat, 10 May 2025 17:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6350F1B6184B
	for <lists+linux-leds@lfdr.de>; Sat, 10 May 2025 15:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03440225761;
	Sat, 10 May 2025 15:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZW8Zp1FQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499E5189F3F;
	Sat, 10 May 2025 15:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746891146; cv=none; b=Xp4rK65w9vN/9b6EuNIedcJ5ls78swUFLTGfCNQYo2uymzr2h6mF4HCwSSrQR1LugTacX9P2qiW9+6vsNA3AWEUssbZyKu/kXCs5LjAHwehmNJFV5/C+cA8nwrs0wbLdqtjk20qTB9XV4o4WeU+qeCiTgQP2SmWZeUfK0PZf6LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746891146; c=relaxed/simple;
	bh=Qc05YvQd0vI3HlBbTp06BdjeXOC450faijq9mN/Ykck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qZngOxqnasLeEfeQYEmN99reeGeunlxXggxkOR+C39tCCwsLnu17ikFSYAkJmk3wa19bRoYBCZPQ57f00PYB/vCliQ93JLpq/xsB7VlBSQKXsz0txONGNVvYtEWwPRMWuUjOpgBEiia+Cn0e/L0WNVHVH37dkAqpGMxzIR+J784=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZW8Zp1FQ; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad221e3e5a2so243446166b.1;
        Sat, 10 May 2025 08:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746891143; x=1747495943; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JO3YataffYPrXuj75gcg3TSw3IJYHLUJXACaoC6+gBk=;
        b=ZW8Zp1FQsqywg3DSAPY9cwpZDObW/i+a7FfpYenJpJVR/mJ5Hk6HZwuSdvqkmg0tgJ
         +OAd6LlnwZgb4ZyA6eIasz6MT1gkC+thMGxeKcop7V7capQLruN/lpHgpb/XZhUMNZRU
         b7ynMrI+7Hgx3yVjAztOqjeSCFAqP5HFgm0DqvEy6Mi74FEEpW2rXzZkd5vtTP+qZrxW
         ozjZEma+hIaEnpzxuNTg0ARylZO7ngj0pMJrAnEGLeiJc+Y98u1pTC1RVktKetpEqzQ6
         L7CIT8oQtZwYnaMvYsz5kqeCTQB0nDVyxmWILQwf83JvXMAwGjFLhd5iKFmsm1v9lpaw
         rJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746891143; x=1747495943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JO3YataffYPrXuj75gcg3TSw3IJYHLUJXACaoC6+gBk=;
        b=Q8TM3qCnIbaPZGdl3bym2o6VV7hdyYyvvSU03htxT0VOqk2UKDyjJaG8GgXRju13Rn
         qIwZmMiC8w/6DiWE2o8zU4rSLHmic9z3Fn6G61PZmo2E630MsjJ6uHJUHVQss2Kn6rfn
         xcpqQFXtUKEuQUjYJVLj+noiPyy8KVGn1SsMCqYJz7OoDKbz0RDx2Z2EC6xHNbP3Q5MX
         2l0vIJZmzQGtvtA+PvwFiQhekUcPqk8+1LkZu79Y8uDRkfpH0/997RV9elF2gwyqrbs6
         +fUCtjZbaLr3U0dKZ7mMv+YAf10OOCbdDCJWGHU2FtDIKNiRjXGX30f40GrbQEER50uL
         v1Kg==
X-Forwarded-Encrypted: i=1; AJvYcCXJbYwUjWWRkqiGJ+E+LZm7XUktIdXsGkQroihzdlPRWlUQtByz16Ul5ie8Hrr2p5orN3CVBD/Ntj8KWt8=@vger.kernel.org
X-Gm-Message-State: AOJu0YznIQ7jzEiA4Alfa8P7LLwsZh5mxww7Wg4JKc1xChpnksk/VY5d
	HbL3kZS3+bSGB7a8TVopOqJSudgNc2opg15WwJ+dIo70XEEihZfK
X-Gm-Gg: ASbGncu6NFusK1Sp97DWSYbPfiAOiMqyiFrMuteg5wCndoKDOophNCuS9hilYZ4PapL
	bLYknkgVNKFmn8FcTsPn+QmZdslVCNB3Loo9pLttG5b0Gl0CZ/MRKDTrQSEQMWa9wp50+TeXl+G
	jFf/ssHDWvElJR+Lx4scgYqGYbDAg/jbY4cHkiP//6hJMkiVYMX8+5c52sxGX+e6/1Q8MHQHmaY
	/noozNmQbUbbz2k7QhIPobqQm8F42/YA3PDuwrxJohmvKdmpuQhBHrkZOiFYbDKg5V/VFa1eg0H
	8lUrvIM+G//tK8M7CdZhlqijYzHMp36vr2s3kb9oqYFEhbJuFNRju3pwn1Gnb7VD2hSmVD6Nj2k
	=
X-Google-Smtp-Source: AGHT+IEOxR/l/vntZrk62iCLv8eENeEgSRGDMZXjwZemo8Lbpx+AM7PncOIJtTyup5q0sHR8zWQlqg==
X-Received: by 2002:a17:907:940f:b0:ac2:49b1:166f with SMTP id a640c23a62f3a-ad2192b7bb7mr718329066b.52.1746891143219;
        Sat, 10 May 2025 08:32:23 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad219746cf4sm332752466b.102.2025.05.10.08.32.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 May 2025 08:32:22 -0700 (PDT)
Message-ID: <62a74e0e-f5a1-40b5-a855-6e9bd620cbd5@gmail.com>
Date: Sat, 10 May 2025 17:32:21 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] leds: leds-lp50xx: Handle reg to get correct
 multi_index
To: Johan Adolfsson <johan.adolfsson@axis.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@axis.com
References: <20250506-led-fix-v1-1-56a39b55a7fc@axis.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20250506-led-fix-v1-1-56a39b55a7fc@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Johan,

On 5/6/25 12:39, Johan Adolfsson wrote:
> mc_subled used for multi_index needs well defined array indexes,
> to guarantee the desired result, optionally use reg for that.
> 
> If devicetree child nodes is processed in random or reverse order
> you may end up with multi_index "blue green red" instead of the expected
> "red green blue".
> If user space apps uses multi_index to deduce how to control the leds
> they would most likely be broken without this patch if devicetree
> processing is reversed (which it appears to be).

Are you trying to solve some real problem that occurred to you?

The order of DT nodes parsing is not a problem here - we save
color index in subled_info to be able to figure out which color
is on which position. This information can be retrieved in sysfs
by reading multi_index file.

-- 
Best regards,
Jacek Anaszewski

