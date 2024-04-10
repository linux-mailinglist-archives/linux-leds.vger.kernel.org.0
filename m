Return-Path: <linux-leds+bounces-1441-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A6189FF82
	for <lists+linux-leds@lfdr.de>; Wed, 10 Apr 2024 20:14:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9D941C22E4B
	for <lists+linux-leds@lfdr.de>; Wed, 10 Apr 2024 18:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99D31802B6;
	Wed, 10 Apr 2024 18:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yhXYTfDj"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB0917BB07
	for <linux-leds@vger.kernel.org>; Wed, 10 Apr 2024 18:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712772863; cv=none; b=bB14LOnNxiKBERNs7cMjswMjIVFd7P5TnyJUc1+SPXi4kYbRxEHbzlKqIHUfBEWqnAFjQ5o6AtHazL9YxE8SQz+62Gjo3vHucN3ipC2kJSpsspW9JFKGJhL/pNonHkdihcZPYR+SdyAsptazrhaetIWsp2OryuQN2t9XUOVp9Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712772863; c=relaxed/simple;
	bh=Gy/xIIAV1IMY4gqYPnEYGC4AI4zv1opJbJknGzalJ+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZkJLe/Y88p+Tkge+btQ19skIIAySUu29btrhAB9JRynIlvtHE9F7UXO5lzjDhqyWV96vv2Pnt+d2vWid/uaXRyZMvoR+6lBu6GjfEwtV5PhF7HFOnOLQ1kTmv2ZWwrgaFZzcQwyKTRMhIM8ZRNUmTMYxZWno5LyvkaM69RdhSgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yhXYTfDj; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-516dc51bb72so5653113e87.1
        for <linux-leds@vger.kernel.org>; Wed, 10 Apr 2024 11:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712772858; x=1713377658; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C0xVS150YzL1/Xjxdbgyf+gnR1gySWkGWU4rQOhTUgs=;
        b=yhXYTfDjBJJGIYqYuMew6SxU49DvSPIgyAiz4S24PbRkKJavtNZVd5Vy8VM0UdCtuw
         MnZ/m3J1fOy9hLD1BsTjeyQOiQJafAnZYmrKWcn4xyedxwtUKspy0v2x+Px//VOBkyUu
         0PmidtRI/TORJQM4zK6GYmCdYz+nd3g24Sj95H/GxYeaMdJe8GHHf4gOTQj43FIiSjgp
         GOBEWEOFTl+uxqfl2W7YbqbJmTe37YTW02cWaTw3vQgdw4NiPNMXrzRFe2Ci+CRb3sOn
         9s05dvk0BwrfoCl0Rk4/t2i0LS5RElPbmqQhJjHBrRXdqy4++fL9g67SA5qKFnCmOGkC
         o4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712772858; x=1713377658;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C0xVS150YzL1/Xjxdbgyf+gnR1gySWkGWU4rQOhTUgs=;
        b=e3ZnekzVrf6h63oNIGbrcCoLjpx9SByPKB8HpwKJKrmBeArrQUmlnVjofLQIKwoOam
         ChVfDMFrHQ9U9m4eS5/PjdPGBIvTTCGr1s2rAQWxxxCV74JnBPZ3lmP4foOrj4ThiWmb
         J1uD0v3fusjLnLLxR7/2LswQIiWaBR3oVcKG9YP8b5PFRU4qPmfY7MZ8K1R3SBYOgVi2
         aIyzus3Dj3nb43WDczCvLOmZqW8ySSBGT2Rl6cGDg2CBCidGkaRUKdOfZmN+f1DRhJ80
         jpqXj4O9cL4MHsNIY/luBvZWEX4EyPH0uYb5fxvKoDp9Gv87LGw0PD59KvmnqmTouWel
         gsCg==
X-Gm-Message-State: AOJu0YzeaLGudyazdAt95sBncsGGwCJQQFdDRMQQ3bZWzYYnsPntXGWf
	c35AJGLleaRkbDH8w4OgKPabnXUr/I87XeGrZSpjkwYZzD1SboMFlGjjmz8COAM=
X-Google-Smtp-Source: AGHT+IHJvdEctTXsMhmqjLzywAkmj1+HPln2kt1QjwJmq8JoSF9B969r0JTZpPS+58OEikc1Y2wPLQ==
X-Received: by 2002:ac2:59ce:0:b0:517:5fba:fb54 with SMTP id x14-20020ac259ce000000b005175fbafb54mr1995958lfn.3.1712772858487;
        Wed, 10 Apr 2024 11:14:18 -0700 (PDT)
Received: from [172.30.205.26] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id d5-20020ac25ec5000000b00516d4c31ef4sm1874863lfq.248.2024.04.10.11.14.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 11:14:18 -0700 (PDT)
Message-ID: <92333536-7f43-4fa9-8d52-ae2ac50b76f6@linaro.org>
Date: Wed, 10 Apr 2024 20:14:16 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] leds: qcom-lpg: Add support for PMI8950 PWM
To: Gianluca Boiano <morf3089@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20240402-pmi8950-pwm-support-v1-0-1a66899eeeb3@gmail.com>
 <20240402-pmi8950-pwm-support-v1-1-1a66899eeeb3@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240402-pmi8950-pwm-support-v1-1-1a66899eeeb3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/2/24 14:35, Gianluca Boiano wrote:
> The PMI8950 PMIC contains 1 PWM channel
> 
> Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Oddly enough, there's also 1 LPG channel on the PM(not I)8950 @ 0xbc00

Konrad

