Return-Path: <linux-leds+bounces-3443-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D43D9DB62A
	for <lists+linux-leds@lfdr.de>; Thu, 28 Nov 2024 12:03:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4C722817CF
	for <lists+linux-leds@lfdr.de>; Thu, 28 Nov 2024 11:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF401192B94;
	Thu, 28 Nov 2024 11:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="rlrLEGV7"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D371494A3
	for <linux-leds@vger.kernel.org>; Thu, 28 Nov 2024 11:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732791776; cv=none; b=o9YBgS50ir6XmjoULOuZljOgp9PuyFI4sOOQCQ/f5UujWNrfj9+AYBVwp6EEs6HDLk99N5NJYY6L41PgDR2H7ShdYpzFX7iJolEe0IkX6HOjWT57Wk6QbG0BpHomRdx7/Yxkf0Nu7NdJHMFdvxCL1On5WoNuk6cjYovVtxtCih4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732791776; c=relaxed/simple;
	bh=HkVtIayR9foQ5xZVMRAYZGNzyqx9gy93kknz1x9CCF4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Va8pychY2UxRbEwrG/GDy6PaqkJLdxsmc9wmdYQgvupCfLja9vUtf/IEYcP308n6A3XKN4Pq90SlHE8VtL2h49emn4K1rG6AvsWCCLgZgzE8eEk8kmu+YyaF8L24JKjaNbrdHLoYsKbtakVkj2o89b9ewyKIfPcq7MYh0rWL/+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=rlrLEGV7; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5cfd3a7e377so806035a12.2
        for <linux-leds@vger.kernel.org>; Thu, 28 Nov 2024 03:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1732791772; x=1733396572; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N2jwobz0tUiTEvoVAQRqFl5xUiWCnjuXqJcLdQu4lR4=;
        b=rlrLEGV7J0Hi1G6VETZBW9SaLe95Zcy/SNuTmz1ptRbEgsA5h6361gmQMCT8qtOqcG
         5nlaKHrTPQtX2z7qylUWJYdo9k/PScwSFquuovfAe4lHPYTVEeQgSsV/ku8c9U0yQ/pj
         AJuwxdz/nadyi0hnKjb9pvD/h6pyhPOHlagrfECXy6XvWlNlfwzQ90LTD1ldqv91FEMZ
         0AfF9r/Ck6uIU3uFAyBcBaU9BtSQyx84Iy1WAX8bAVbq6R0Gf5GecFkZlBMtfVgZn4up
         wFvjY5Oef/3hPC+bi+Tw2z2hUNYvIZ9qWSrhkvSM35SfnEvXik35QPcBoSaTAGFgCAMa
         XPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732791772; x=1733396572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2jwobz0tUiTEvoVAQRqFl5xUiWCnjuXqJcLdQu4lR4=;
        b=MSBMbK4xbjTcdJRQ7EKJiMp4zxsI6cOwGuY8A2Yt3i/SUbH2FTHPcTuFj8yHhKuqC0
         bDhvVLjYIC4dCHCG8BPxkGLmHEi9+hrcUcTXtvzXmbHroaw2HmPa0/igcz3TohIgp98G
         rHIzFfzQYhcE+B4lECpY5T4KzQxp6G0yjOn0B9/LPKdngUd7JmU2E+DFPR9wo5jY+pg6
         M7+Acs6S0jtkS7mSy4ttNUWX7+VogUFgMRzShXvm+sWyntw81ESg3I6Xls8ujUzKXTF6
         RDiBd8urNK8VVx7pY/gkqTY7OXbTQDYgS8OduXGnMx9Rl7mc8KEl2jzBezFZ1w1Daqxv
         PnfA==
X-Forwarded-Encrypted: i=1; AJvYcCX4nFtdb3quhoRQsS7Z4LSwIEVYyfo5tOKiYazKxTS1X64tblph3caB+giiP51f7IgY8L/uKzHnTxJh@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk/Ou767XlZDbmgn1cndZM9ukNMapsDAU7a5H6O52Oila1HV/b
	qZdpbagwFFXnJLKaHwABaqnw3g507J/Kl+eSOvdFk8SffAvk8hzOkZlnCZTJSmE9vlISltRdv5l
	GznwYp33CmB66Fy/mz4Qo4/gIetkR1UReiBv+xeNhhKkoWfO9yCgjrTaq+WM+y+9seBS+giYknm
	3LV5SjwBDnnHTZScFQ5bvy2l5Q
X-Gm-Gg: ASbGncu+dtKdfTxuMmEwPDl6UT+luCiM011/HoE2dNF6jENVTwWJQNSMxTK3aE2TupJ
	l62qp7YkVsXnUyD72RFWLAxTtNxi83ZULLrH3+aJYhQ9PYgc4nyo9cYl/i2b//lgXK+JzUUhNow
	YOi4yIPuagYnnCI9XDzwjuOAtTCGfTjj1pyg0QQLkYjCMt4DOrNEs7M0TOl8LgqUJGijmYvuNg3
	ognw2Iuce/TZcUgV+CZjhrYQAT2K4hzO/rR0oE7EVNY9lOgMMhdQESu+NUJVTR9/h451WumlGHy
	/+uJaFbaRokLl/6/
X-Google-Smtp-Source: AGHT+IFX+FbOsE2yr5AmUhyG7Thr6Holt/fq6gB5PxSluSHCix4v+HkEd87hynKdzyr22pwGJOpyIw==
X-Received: by 2002:a05:6402:280d:b0:5d0:a43:cf40 with SMTP id 4fb4d7f45d1cf-5d080b8c9bemr6225787a12.4.1732791772129;
        Thu, 28 Nov 2024 03:02:52 -0800 (PST)
Received: from admins-Air ([2a02:810d:aec0:2a54:184:ec69:1c84:8a04])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5999058fbsm53856766b.143.2024.11.28.03.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 03:02:51 -0800 (PST)
Date: Thu, 28 Nov 2024 12:02:49 +0100
From: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
To: robh@kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
	conor+dt@kernel.org, pavel@ucw.cz, linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org, krzk+dt@kernel.org,
	devicetree@vger.kernel.org, corbet@lwn.net
Subject: Re: [PATCH v9 2/3] dt-bindings: leds: Add LED1202 LED Controller
Message-ID: <Z0hN2WLfIOEx7x8l@admins-Air>
References: <20241121165829.8210-1-vicentiu.galanopulo@remote-tech.co.uk>
 <20241121165829.8210-3-vicentiu.galanopulo@remote-tech.co.uk>
 <173222307644.3811087.7654504224510124517.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173222307644.3811087.7654504224510124517.robh@kernel.org>

On Thu, Nov 21, 2024 at 03:05:14PM -0600, Rob Herring (Arm) wrote:
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.

There were no changes in this patchset with regards to the dt-bindings.
I wrongly, did not add the Reviewed-by tag.

> 
> Missing tags:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> 
> 

