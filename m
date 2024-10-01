Return-Path: <linux-leds+bounces-2908-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7284C98BAD8
	for <lists+linux-leds@lfdr.de>; Tue,  1 Oct 2024 13:18:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25C111F2182F
	for <lists+linux-leds@lfdr.de>; Tue,  1 Oct 2024 11:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D50C11BF333;
	Tue,  1 Oct 2024 11:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eg+8lt8Y"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17ACA39B
	for <linux-leds@vger.kernel.org>; Tue,  1 Oct 2024 11:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727781524; cv=none; b=XQJHCOgiXLOvgiCwMHBcQxQAK9KJKou+O6w7fwCy5zsmQRwk8+yGnq6/be1drdcB7vQcCgzdvmFMxmyOY6AtWL0C0756MWhgPLAjDCmGcvlZYfvU9NVD6yVOm7C/cxzH8+QJztB7YdYNX2UR/klxaTduLzpAtyE1iyOgVGEBFGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727781524; c=relaxed/simple;
	bh=0icwQPXpYDOh3mLTMMknGBG8ooO+cXmtB/vqPjajuBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MlamnBw8ZrA5KMfanTcVOlg/fjafRK9DQVXkzzzLTk6u2l/hLBnpILSAlsycxj6LHx9C+H8duH9BdD7uI5l1Ct9uOk1PC1nzr7B4M1/ML/oDHo3f4cT9v+wtBaOI99jAW931DXepUp1e1b9Wicb4h8JF02yiK0uWqIyaBPJROBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eg+8lt8Y; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5398e4ae9efso3064316e87.1
        for <linux-leds@vger.kernel.org>; Tue, 01 Oct 2024 04:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727781521; x=1728386321; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1U6SzjOLd9tmaMIoGva4xG/5LpPu0blevtyOevY71Y=;
        b=eg+8lt8YLxr+bnejVRAHXZxhyOaOWsxIq2Kiy0ePgoq45O3ee1iw1/sn4qr4+9WdTo
         zPUXrwBDnIFUy1u3nEI0V/BiVVOxJFelJVARYj3wuSgHi05bbLf1tC/pwgd3Y3E5NZCo
         z+FZxwifAi8un5rrYwrvlldazlNlUla5N3Ox4IEToKewoL3h4HQLDAnh0XTG3Wyq1eTx
         DvaUTUQ0za8UT8faDAJ21ciwmti7UHeVOce8ODhqSj/UECEw/p9iJfBkK3a5PIsOnNfB
         rkkI3bvrpY7Aga/xxGxaKjoV1B4hAhwBw6bArTONhRFnEePzo72Tm/6L4IJokbeYqA89
         jryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727781521; x=1728386321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H1U6SzjOLd9tmaMIoGva4xG/5LpPu0blevtyOevY71Y=;
        b=ThBL0Ov40gf8qt3O1NPU1dAchgNQy3z4QyiFpo9hI1df3uzgxXvDfsxnvTpwX29Cdc
         e+r9ppuftdRT7sSA07Teq31rXGe7EfAabpl640u3+xOLpa/cTFxCmS7C0/5574ynW9ob
         6WAreHLXFATieJ5A4jj/XMup/1g+SF2Amkeeasgupi4j/Vka2bNpWNIsYzp9FhOYqQ3w
         O1HO77F+tL1C7yhTpyecvwgxHhVhZ41H+B/D3pIDoEV8581FZZFDMpXcyxgg5lu1fzGp
         z6QvyIs7DE09hJi6cgj6sFRmwHTqckzcAzhuL3ku+XSrsgk15ms/nBVs00tNdyDmcX2o
         bQHA==
X-Forwarded-Encrypted: i=1; AJvYcCU6rrZW/YZkO+IpggyNb5HA1qLBejCu3v8sGInpK3P+z0zuvW+JyuRqvyPnBIr6DETmIcAuTMgwNkTk@vger.kernel.org
X-Gm-Message-State: AOJu0Yxefnhy+0AdGdLPfly2lJJPa9vEEwrI+9qtxhsVu7hiY+p9bUzk
	Y4Hn/GSLr0URr0S2EEk70CEtBV30C7X+YUSqgoeuSdKLqHjmGelIKmJw0MnOBgiNFDZGZIuuLwb
	ipNn23vLumFlJYknydLKa1/cBQ+7LsXFZoqtclA==
X-Google-Smtp-Source: AGHT+IGVVP3SM9Y2lyoLaAnlnjr6mEhgDJWR/7EVr3JhTVLLX2ydx2IsKFpPjBzPzSbWiYJaSMdHQbaIhVvCr5IDT2M=
X-Received: by 2002:a05:6512:3041:b0:52c:adc4:137c with SMTP id
 2adb3069b0e04-5389fc3b745mr8112536e87.20.1727781521088; Tue, 01 Oct 2024
 04:18:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240928-bcm63138-leds-v2-0-f6aa4d4d6ef2@linaro.org>
 <20240928-bcm63138-leds-v2-1-f6aa4d4d6ef2@linaro.org> <fmuxz5w77tfkodvntaley2b6kv2c7acgcfb6ojk3plw7g6rbdd@sahgzglndrda>
In-Reply-To: <fmuxz5w77tfkodvntaley2b6kv2c7acgcfb6ojk3plw7g6rbdd@sahgzglndrda>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 1 Oct 2024 13:18:29 +0200
Message-ID: <CACRpkdYqR3N0EaS64gqSfRfezsrSueSKHPbMc4A0g3hHg3y6dw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: leds: bcm63138: Add shift register bits
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 28, 2024 at 10:05=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> On Sat, Sep 28, 2024 at 12:29:47AM +0200, Linus Walleij wrote:
> > +  brcm,serial-shift-bits:
>
> bits is an uint32-array, so you need to limit number of items, e.g.
> items:
>  - minimum: 1
>    maximum: 32

OK this is what I do on the next lines:

> > +    minimum: 1
> > +    maximum: 32

Am I doing something wrong here? I see you have a dash
  - minimum in your comment but when I grep through the
existing bindings for stuff ending with -bits it seems they
do what I do.

> default: [0]? or something else?

Since we need to stay compatible with older device trees
the default is whatever is in the hardware after boot :/

I guess I could write something about it in the description.

Yours,
Linus Walleij

