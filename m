Return-Path: <linux-leds+bounces-776-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BDE84C7BE
	for <lists+linux-leds@lfdr.de>; Wed,  7 Feb 2024 10:42:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34C191F28296
	for <lists+linux-leds@lfdr.de>; Wed,  7 Feb 2024 09:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F16C250E0;
	Wed,  7 Feb 2024 09:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WyyYKhIE"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20078241EA
	for <linux-leds@vger.kernel.org>; Wed,  7 Feb 2024 09:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707298891; cv=none; b=C/hwjYJGOJYn8WtO7H6tB0Rl1/EmWAt3N9ubWFx9A/6cJcgElpzapxCnA141J1tN5Hai6PDD4SwC4JTmaYkVcxM15t435B2RCJigZ9RFSlPlXWMZiZIJjHFmJ2851mFyF+9z5qVWNQoDnK5lIMpH/1POH5WEs2ybDk0tykauC1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707298891; c=relaxed/simple;
	bh=NbPgDHMBh3FUdfqTAdcQlpI4OiOyGv4F3zqlMC49YxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ia3IFYJmfHQ5rLasyN5rdRvm+JpxbXDZeSpZYBna17T5ZvHODLlO2jjvRj7NQwrHLoGlvAi2rTuHHRrukgHawoDawKqW+38xCHiB9brP43dtyx8SmgQOlQTiN8Bqpx/JyMRGQgtuzjHasbnBIZ2C9/Gz8L4wKEERm+ROXGL4nPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WyyYKhIE; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40ef64d8955so3421495e9.3
        for <linux-leds@vger.kernel.org>; Wed, 07 Feb 2024 01:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707298887; x=1707903687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nJcQua4beKi5Q7c6WQ4fkxE+hTunNvGHG1uvhFXmM7E=;
        b=WyyYKhIEQVAUgP3ao0C+xSXUyLq+klYHbbi/pQEWs30VoMovgsB7Mt98KN+YloKatJ
         Bnn55A7xilL14dLRfrUpHmxPtwu9zOhxjbMJcccbsZY85KNG6HY3q1c45zUg7+HS+R8m
         iaX1ojdh0ltGxPzLMT8os58dEPntIOXGLjJAe2eMxNPhZUN2RI7sd4f8QNnL/NdpMN/q
         9TcchM40xUw4NBaylOqIeYLBiC0qESX4iS0Rg/3U2DjkwtERdmglGL5Mic1hOa86RiJY
         JhPwsZqFJCVUwv9zl/UC4Jp5aD6pYajBA3vWNnyeTP94HVFU+310TEyHA1oJMAQ0YKBu
         yMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707298887; x=1707903687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJcQua4beKi5Q7c6WQ4fkxE+hTunNvGHG1uvhFXmM7E=;
        b=FiUBuj3K4e3wUhmimkLv5Z5tu3GyyPWm6JhMPDg0VHwL4OsX821Nay3FytGQW7d9Rz
         xOq4QQMl8p5fbNdPNW0dr3VJuehn0HS2oVKgjbbyFspo98l6f+ls8M6igZh3VdkyRSkw
         RwTuBzpp6KO0vISoeeoB32LcAtgSGSpxezHM2F+5K+TM76yNU6DuLRRJFRCk1AQGPpAP
         7ViaQXZ7qUi7GZLeNOKVd1GFYfLl+oFUgIFSLbBpWobLA4lwX8tJbO+HY5QeesH34mv8
         6/UiNVm9BOyoEfuioiGvdEIzg2ZYn5d+Kq5/WIaG12cvTPqPAJ26iJYzsk0HJZz88Zah
         IOoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA2Mfi2QHkEEesUG5il1SH+J7TIZb8mR9HWHXgvsJ6wxhqB0sqw6fw1lFiw2y8CBzfMPdJCLdLrLTBciayrflkaWMq6xe9rKhr3w==
X-Gm-Message-State: AOJu0YxHUZ+Eb81jsHTONbk6aLAIzOC3ZJ+bOrntg4kYopdPq8ZheCD1
	6cny7HPkZp2kGGkiFq500E/E/Ao1PjYpqtFYGiSe93nhkeeDmevlPilu4rNzCjw=
X-Google-Smtp-Source: AGHT+IE20vw+DGyUgaFh2+PusZg0M3tzgwfUl7M4aCVMH8JlS57IagVjAAokJEc9q+vbj9wA0X1WkA==
X-Received: by 2002:a05:600c:5782:b0:40f:df2d:870f with SMTP id jx2-20020a05600c578200b0040fdf2d870fmr4685383wmb.41.1707298887344;
        Wed, 07 Feb 2024 01:41:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWeF+6CVSJPghSLPHwnbJR/9GtW3yaOq26rnr1j+FWYU/htOGgZyubHmRuckeAJ0ew0JU+/beTTHiGM9SlKA+U9OBPXzxlQjt48B1sTEokJW7Av4hTTWUADV5QSUuWXF4usFskRUL7Vy5AoMhxFCz/imHznv7KlZK/n0bLGg0drcFDYlRgzqlvcu34FtCb3yztbHAqQ7FsSgXQ333/PNi1ot/qYRNnLYYsEWjYdPJ1Ebm1ivKwmvbSvs5Kw2P3iSPyL4JSn3c3Pot+npagmYrVpCthhBg7j6Fm4UVfFYqmoqTos+eYbRnSAfjl7p3IXTzxA9Q8Z1BDw4ThQHSxFSGh6qyvkCaFzb2xRd0BxTP//Ydh1y8VTeA5ogyytMGZ+fDUnymosPFe6t8WCIzXE/QqX/HizTsWFwqY/suznxCsvCmCbtwTS2fWYSgeOqaf5H8dvLoPYwk1imInriygOOp2D
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id o14-20020a05600c4fce00b0040fdd7cbc8dsm4661402wmq.47.2024.02.07.01.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 01:41:26 -0800 (PST)
Date: Wed, 7 Feb 2024 09:41:24 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: lee@kernel.org, jingoohan1@gmail.com, pavel@ucw.cz, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	andersson@kernel.org, quic_kgunda@quicinc.com,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: backlight: qcom-wled: Fix bouncing email
 addresses
Message-ID: <20240207094124.GA7924@aspen.lan>
References: <20240202180151.4116329-1-quic_jhugo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240202180151.4116329-1-quic_jhugo@quicinc.com>

On Fri, Feb 02, 2024 at 11:01:51AM -0700, Jeffrey Hugo wrote:
> Bjorn is no longer at Linaro.  Update his email address to @kernel to
> match the .mailmap entry.
>
> The servers for @codeaurora are long retired and messages sent there
> will bounce.  Update Kiran's email address to match the .mailmap entry.
>
> This will help anyone that is looking to reach out about this binding
> and is not using .mailmap to pre-process their message.
>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

