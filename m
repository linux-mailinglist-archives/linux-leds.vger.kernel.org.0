Return-Path: <linux-leds+bounces-1442-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4495689FF84
	for <lists+linux-leds@lfdr.de>; Wed, 10 Apr 2024 20:15:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F02C01F22749
	for <lists+linux-leds@lfdr.de>; Wed, 10 Apr 2024 18:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 754601802A2;
	Wed, 10 Apr 2024 18:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EADTuXU9"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CFF17F36E
	for <linux-leds@vger.kernel.org>; Wed, 10 Apr 2024 18:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712772904; cv=none; b=pVgD4z+R2ZD8nHoPgRcM13WhItH/DtHd5HdJyqv68x0p2T69ezjctefiCl+8xTPvy5tnuX4HesSHOPCRa0+RHreft3ohRQepK5vUvQxAIEw/WhZiCeBLWZfNlBcCOfrpSPuEuGXonc8spwwl3GSQGCE/wc0IHuTB41d6VG+tSl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712772904; c=relaxed/simple;
	bh=bgxBc5QL1EgrGNz1Nh0tisNL2vyofmodpiuIjwYsJhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P9pgQ+hmvnenA0SvKI+0UgaEzXnrRGQ0vC3QshxKD0JONh55y9vMDvn/k7djGF1YjK5rOWausIRBsMk8eCADKiClEgOpuSPS0AqshBr4NLh3aFkb6ODHqjHiCF+n4bUrGSHeUxG7cBTLi6MW7B7W1SWIIev70BXn84ydgGlJOzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EADTuXU9; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-516ab4b3251so8001196e87.0
        for <linux-leds@vger.kernel.org>; Wed, 10 Apr 2024 11:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712772901; x=1713377701; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5mElfgPubZ0c/8Pokd0nDZ//CRbTWxbvbOos9Zm32WI=;
        b=EADTuXU9LCDxn80s/DTc32NwUDCtZPjHalHbwK4eOl5wJ2EFUXfft/8N3VgxHT61af
         aI0xio9ys+iFOQUOueg6NiwHaYpw4JUm220DdLshcKOHY3kNTuOqJPLX5LhLJEMWN/Mu
         BfAcez8NFHX/sySDEj3ZcIoS1BKFBfYBsvNmcZF7qOfsTWlNQtgGRCWx+rdi/NwYe1dw
         nWy50PxeijJLym5pMECb1WQYo4TfV0+mJEbv0pfiZzNf0C4iW0n6VUUjuHDgLYN6fc/i
         tAUlV7HJTBx3RcwAUNBKUYdedghRGDr4u+5FVDpWkEZNWdmF0lvH8SlyLRgOBIC0XI8+
         AP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712772901; x=1713377701;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5mElfgPubZ0c/8Pokd0nDZ//CRbTWxbvbOos9Zm32WI=;
        b=ALjlkL5fpdK3Aj3Vw1kBOeIWJ2qPjysP0pXtpHMEHhvw6Slvb7KYicl5avyjtq4vAU
         k3SZz31in8G04nfm8rAKwzwx+XSHc40UdNKGyxk2acBivj/eu+2JBCMXCo2QGH6+Vr0+
         VE4En+o/Bu1++UnVRb6lCnz97+6JIjtkAswwNlsjPH5S7j0i7Qmj/TD2LzvtLMHM71l+
         dO2QMadOE68wPtLrUuiHUYexYvdKGAoB6z4rrwEQeX/7Tffd5mhT2vx6VW8CYwuOfdph
         5BG0tjmwJ9sQNIMXXipb2F5/k9atWcff6+RyIR09q/KM5/JclxmBhmFFceaKgxolSbXM
         vjeQ==
X-Gm-Message-State: AOJu0YyZ9khAbMxUcNJqXbFobn5md8YKuUJkjRgYv1rO15m1BN927ldg
	drJ83VOSiOzKf03NU1RW0rptTZd8pkE/6rE9YDnJlQ39n7ExNa6k6dYU2EXZ6Ro=
X-Google-Smtp-Source: AGHT+IEx+N42sULyWh0hFoGahD+v4vOuxraHP+O8zMLn+GdI27fRh0rSrMwRe1q9w/Amti/YHcM56w==
X-Received: by 2002:ac2:4289:0:b0:513:cf5e:f2ad with SMTP id m9-20020ac24289000000b00513cf5ef2admr2477386lfh.60.1712772900853;
        Wed, 10 Apr 2024 11:15:00 -0700 (PDT)
Received: from [172.30.205.26] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id c27-20020ac25f7b000000b00515ce9f4a2bsm1912642lfc.35.2024.04.10.11.14.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 11:15:00 -0700 (PDT)
Message-ID: <3b457615-533d-40b6-a637-770eb9af8956@linaro.org>
Date: Wed, 10 Apr 2024 20:14:59 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: pmi8950: add pwm node
To: Gianluca Boiano <morf3089@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20240402-pmi8950-pwm-support-v1-0-1a66899eeeb3@gmail.com>
 <20240402-pmi8950-pwm-support-v1-2-1a66899eeeb3@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240402-pmi8950-pwm-support-v1-2-1a66899eeeb3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/2/24 14:35, Gianluca Boiano wrote:
> This node is actually found on some msm8953 devices (xiaomi-mido) and
> allows irled enablement
> 
> Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

