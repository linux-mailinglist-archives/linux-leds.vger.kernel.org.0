Return-Path: <linux-leds+bounces-1401-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 305328955DB
	for <lists+linux-leds@lfdr.de>; Tue,  2 Apr 2024 15:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF9291F23329
	for <lists+linux-leds@lfdr.de>; Tue,  2 Apr 2024 13:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 075CD1DFF9;
	Tue,  2 Apr 2024 13:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fTVF+N5U"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509FA5E060
	for <linux-leds@vger.kernel.org>; Tue,  2 Apr 2024 13:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712066161; cv=none; b=purwv4oGceVfXom889zX+EGY0nbgvsGuNhwbhIYT9TqfmdSueKwavbrUmD9Op13ZvbMpK5jR7whlyqwyjd2/8KERka4y6OqtxK1GKVXD6DWNbVBoZbF/5FfKW9xCzD4Tu7vGp9qf8suYpY4j54VDp4GgW+VpRGW+u66/GgAmD80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712066161; c=relaxed/simple;
	bh=3RYlQMdAk1kSbFeG0UabxDH8CjbXI3Avrk756agQQy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V+e5CA3EH3S3RRt/NaMED/jaHLj/1+MGIuDldLGMktI2TdRQ/cv+NCi3w451zhtgBdyxgYNx0+IHU7PauFcVtgfmtIjWXCwGxzH0h4OuVAduaMJbisNdoEJi/C9pDxprxHlN3FuBU0efufQ+ebaCGQstVwoDOQu9B423fbK/Joc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fTVF+N5U; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-515c198e835so5979360e87.3
        for <linux-leds@vger.kernel.org>; Tue, 02 Apr 2024 06:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712066158; x=1712670958; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Rr/3jgsq/y6quIiVf2XQx3I3wZFyCdLaPeu+eAcGk/I=;
        b=fTVF+N5U5Idxrygpw0jVY1d5bP5tyhHc07WlA3yUixXs9butsLipIchKH8Mh2+0TPA
         IqiMIYCWBYkwFx5BhHXsy2eikDxw+UbiThRs4NZidFXKwOdjBq+GheUmVv16tIXIc+MN
         vyhnmlvzSCcAQVoUAo7DIjPGsv5MXvsGEw6XsgC/CgBxW9aTmbbwiCXwsQaueQE1RXlk
         JzlrjDFSft4Ym/MSs8IHUGsemLmtg8C9tpNwz5dxkw69FfsE8v6de7Wy99mguRW0rqkH
         3jIQ5v8yvtsKcyfpKtfekbzDp508BgRlWN/4GV9LN0WMOjN6DqbUnPRZIzOTnPf2y+IF
         b9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712066158; x=1712670958;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rr/3jgsq/y6quIiVf2XQx3I3wZFyCdLaPeu+eAcGk/I=;
        b=mSOGV/CFtdUq51kGtYHnj4YouaYpfuivg5enaydpglQvNFVWiOGY3FbGu28De1atiN
         cikZlSqc4MK9KA+78uA23O5eKQ85lIHGlIFHwNqQ/ehkglLS0/r19gk5euT8qbbbiQIB
         oCe06S0CmJoW0y7YurOLAifiLW6TyEMTiHZ1kiToZBE3aaio13kLUZzlPpt/J3m4ODo6
         TQDxJpNJqV+sbY2CLUOC8TEkKJfur9TAZNMGLubZjVJPCxsRpeN8zRfDL1i0CXkMlrJ8
         mstQ2ydrEF3w3yccehQkzSu0sFE91WMLv7XpgR20cnWqB8ZJG0Qd1qvfMdKknvgHeomQ
         BeKg==
X-Forwarded-Encrypted: i=1; AJvYcCU+LtkQ9NCROHAu7M/WACsgMX3AoUKDDZdt6HiHLNUM30k0tnkalcCsXDQQJN9T84FsU+eGBmXgurbZYSEXHq3rU/cq+Iln4mPqOg==
X-Gm-Message-State: AOJu0YytPoxpDl4E2rxQKyBtzbEqa6dp7VIXXlUjBny3Ww7O7jiwP9Jy
	4sdw0gu6PLN4QP8sZ2uSKUnrO/oWs0JpbIUzVje8Cb34YKFJKkY/h7+Qj/j89sk=
X-Google-Smtp-Source: AGHT+IHF63flTEx8ct3nL+qzYKMao881y40Gb4WtlQQ9zGIwOpR9jnpo5n0Y2QLMMn5WL81JG3JifQ==
X-Received: by 2002:ac2:4c16:0:b0:515:d3dc:43e with SMTP id t22-20020ac24c16000000b00515d3dc043emr6673463lfq.51.1712066158248;
        Tue, 02 Apr 2024 06:55:58 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id r20-20020a17090638d400b00a4e59587f63sm3506762ejd.193.2024.04.02.06.55.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Apr 2024 06:55:57 -0700 (PDT)
Message-ID: <6b47886e-09ac-4cb9-ab53-ca64f5320005@linaro.org>
Date: Tue, 2 Apr 2024 15:55:55 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: leds: add LED_FUNCTION_FNLOCK
To: Gergo Koteles <soyer@irl.hu>, Ike Panhc <ike.pan@canonical.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org
References: <cover.1712063200.git.soyer@irl.hu>
 <8ac95e85a53dc0b8cce1e27fc1cab6d19221543b.1712063200.git.soyer@irl.hu>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <8ac95e85a53dc0b8cce1e27fc1cab6d19221543b.1712063200.git.soyer@irl.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/04/2024 15:21, Gergo Koteles wrote:
> Newer laptops have FnLock LED.
> 
> Add a define for this very common function.
> 
> Signed-off-by: Gergo Koteles <soyer@irl.hu>
> ---
>  include/dt-bindings/leds/common.h | 1 +

Do we really need to define all these possible LED functions? Please
link to DTS user for this.

Best regards,
Krzysztof


