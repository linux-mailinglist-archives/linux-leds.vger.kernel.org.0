Return-Path: <linux-leds+bounces-5244-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6E4B2C3B0
	for <lists+linux-leds@lfdr.de>; Tue, 19 Aug 2025 14:33:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 586C51C21F5C
	for <lists+linux-leds@lfdr.de>; Tue, 19 Aug 2025 12:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2414C3043A4;
	Tue, 19 Aug 2025 12:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kLR+ngqj"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6C230505D;
	Tue, 19 Aug 2025 12:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755606521; cv=none; b=kuBl8We4WDQhQIK7I3+cCPj3GDDPhLz5o75RWEUR1/IlJ4JeaJovj5olhnN9S36tykDA4wW05QIERzsSYwmIhzbbDvFAd+OK7g9fPNSQGggrx+HWzPrNF99eEH/ScFFkPqkHuCkctQzCs0HPZDn+MzLqEXbpvvv/o8XX6PmthsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755606521; c=relaxed/simple;
	bh=73NLA3Q5TxwI++kTf2HzDKfU8xX1fFXua00XcnHgTMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FFyZq1iZahYpO5RV/KyA2tu56K7VG9lQoTs0xMQBdNt60t1XBOPHBPHi0rR+XQxDF/GRSisYqLI3hNDIMLKKvwan8YYqGN9f1wNBk6ndyripSiq4vl0cl4I5p790gehJKBUjylmzmVUUM3ObFnau8lWpmvRZI9C9QV30lQ4mjks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kLR+ngqj; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55ce52b01caso5998959e87.3;
        Tue, 19 Aug 2025 05:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755606516; x=1756211316; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73NLA3Q5TxwI++kTf2HzDKfU8xX1fFXua00XcnHgTMw=;
        b=kLR+ngqjQBGGX1PH7AvR8L5DwCsiYw5sKvOqlPPr65fSfTBUr7WIRrNvF+NyJp7U+y
         lqibKPKYMgUJS4xOYDSkjFWSet5fB1uOv0RVZOMuWAfCKYnIdWf3djriL72it3gofQoC
         MSy4Ud2SR8hDDIIpSzYxM1FhZ95TrLZZKcfHC3WcBUbl5j1QbhZXn4b6kv/UBf6Uaw+w
         TEUbbWPifzV48XU2OBkwNZ3kipU1p5wpWyZDoCu7aPp7SBvNVxJvvHzCEgfmDUeLPFDP
         GdYOeOYhdliaMUSS1lTm46Hgq/n8QUtK5mGDQ3qaS88DWyIP23VSgDSeRAytz+OQuuSH
         woXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755606516; x=1756211316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=73NLA3Q5TxwI++kTf2HzDKfU8xX1fFXua00XcnHgTMw=;
        b=ivenKlRVOP4BgpY4F3AeALDtHMPTUXZNZ9Xy1zFgGwz403aDSXqtlVs223hsVN7gYj
         5lF3xhIVhkEN62GaKfCbamUkvLTsTZetqTFhNiXkmvIleFZjEcSJo0zVudZfP8X8ce3p
         j+mmqhq2vTzM9tCs3LXl+p+OkXnGa94OTOXeo16M8oXHD7BsJFK6d+LL9lmGb4/XnwoK
         yoRTakamxz/g8xXtqtRccFe9gUoku7c5lnLilN75jWpWVWAjHWmdwL02CemQty+/rz3L
         AdOhaeZDVgxBRCCKclSWguXBOc10E29dZ+gEiuOV7SpvblU8YzDGSbgimdfSn0HjPZzP
         lMYA==
X-Forwarded-Encrypted: i=1; AJvYcCUHA5g+waw/P0XFEulbP7gt2E3W4bzGOYe/+nTsihvdPv+0wk89NNyePSrBUM4uFY6PGWHknncOJarYR5A=@vger.kernel.org, AJvYcCUoOnXjucBUS04ciW9+SaMEvskD/wLt+B8OAtM043xvpl2kfTijS3HZO0En8rOCdAk38IUu+lS37fUZ@vger.kernel.org, AJvYcCVEUbCL17NY5qvSpxX1z4lyHHnzqmkNG2mz2KFkuzJDlW3UcsQB2wG9VAvy1Rl32PrYSnWw7AcdcSVhiDih@vger.kernel.org, AJvYcCXZ8bqS81wKj/sj9XT1Cl19P0W1r1D9vg0CKPKH2LGYMO6ZF2pEPOKBge9eD4Xw2QXMpT4j33aDNzEsqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDC9AgP+3NRJXZO27Qst12IfmAE5OStELG+fJzFqHdsAUhzOV4
	gh9HsPLyfAOkU3xq439McW1k5OkHLDfQLjoZ+t3DtAxXQqX6ZStsq+gfay7HEvebnieNG47KgLi
	Q11atqaH4kH/g06eIJKcuE37niLpzjKs=
X-Gm-Gg: ASbGncsqkphR6RMmUC8PxuS9nPT4KLpWP25Kf7ZpEfL5p8kVgTu2GKNgVkU/Jw+Y67k
	MK8P/UFrOg+DJySqSpS0f7WgZB8khu0plZT55ZGLzZLfz8COZhCwuC1EhiHt0O5tf97tv2C8s+k
	e3n2Y9Rr5UrY7u9vsjMtz0tnwaEltSzROoMW9CUo+NIRDR6RskDit2DB+aLVF09Ne1+Zn4YMiNg
	4y4SokV28olp5ZTYCPOIMPfzRGa3CkBdtuCAIY=
X-Google-Smtp-Source: AGHT+IF3FdZF8lxL8RpNSUh6zxATY4SIt92cNJtcaia124EXxHOqkJg6/HCXrud0DRgssmpwJMmfWsjfkko12V6DytQ=
X-Received: by 2002:a05:6512:1349:b0:55b:8e2e:8cc7 with SMTP id
 2adb3069b0e04-55e008538e5mr661274e87.42.1755606516081; Tue, 19 Aug 2025
 05:28:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819-max25014-v2-0-5fd7aeb141ea@gocontroll.com> <20250819-max25014-v2-1-5fd7aeb141ea@gocontroll.com>
In-Reply-To: <20250819-max25014-v2-1-5fd7aeb141ea@gocontroll.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 19 Aug 2025 09:28:24 -0300
X-Gm-Features: Ac12FXxqW79wXsLJzEF9Uadzf5uAoXqplbY5O5fWW6-5y6AnA9c00um3MEHlLP8
Message-ID: <CAOMZO5D6m3V2ZpFOtabrkvf6+SGE+3-xpAE=PZo+Ak=49ozyLg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: backlight: Add max25014 bindings
To: maudspierings@gocontroll.com
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, dri-devel@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 7:59=E2=80=AFAM Maud Spierings via B4 Relay
<devnull+maudspierings.gocontroll.com@kernel.org> wrote:
>
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with intgrated boost controller.

Typo: integrated

