Return-Path: <linux-leds+bounces-5056-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D610B03A9F
	for <lists+linux-leds@lfdr.de>; Mon, 14 Jul 2025 11:18:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65BA1189F8CC
	for <lists+linux-leds@lfdr.de>; Mon, 14 Jul 2025 09:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E77C2405F9;
	Mon, 14 Jul 2025 09:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="lvdeWwVj"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A53246796
	for <linux-leds@vger.kernel.org>; Mon, 14 Jul 2025 09:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752484603; cv=none; b=Ma+xq73VXo/yHBGLEWQyufLzEYzQfdmEutcSk6F8uhU2OWf3z4BzAqptGm5InYOya2lxkaHPDyLmCdcaHM6rqqgtLznxC2zGG9r2nCdiJxgCUBSQyhmkHEVkHru5cfHDNtXWdQEN+OskNHbofquKJcz1pEMa1lrMgF6dVp8kDio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752484603; c=relaxed/simple;
	bh=nG2jwbcLk7SXQKXcTmNSqdZ+/DC2xEkEzu3JnMvQfYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KAT/+1spIOuZyIWna6fJ3CXlDRXaGjIgV2x6ojks8yPmln6efs7UTux8OZRIewlppxRyh/jZJxFdqaB16KQ4EpPuhGWr+LzcAgTyl62jtjqqvIBAir+qouTZwOglFokgfVIlvNY4WCdmQavB1r4QFoGsYCC7mwfk1smlqdyb4Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=lvdeWwVj; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-713fba639f3so33532107b3.1
        for <linux-leds@vger.kernel.org>; Mon, 14 Jul 2025 02:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1752484601; x=1753089401; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nG2jwbcLk7SXQKXcTmNSqdZ+/DC2xEkEzu3JnMvQfYw=;
        b=lvdeWwVjKR1Pf7nmoNWj3Dn90ESTbhWvKog7RDq9VtpFOsTClHn5MejmUsdBFqCTyU
         PApnZGWdkWbnOGsMx+VnXgXd8Azc6ijPCAiePwHefBCwVIEE7Uq0jkRJxqrdh11MiT8N
         yk382KQjVGqdCLWE0oZoWBmmzd4+LpDkuHZKIK2nrM0jswMxhGnmqqKXGsoc21iP3oer
         Bw/io/VZjAPsOmOYtgASop8OfKVBsONPS+v4Ltlxp/0llxov1WwmK5eSppqwUU51S0s7
         yYEtgjseZaAFmtUsN6oHWkNfiafLKn18F1RAg60G2mWQxEcAbSYruHyj+acEVNyngwxz
         XlTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752484601; x=1753089401;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nG2jwbcLk7SXQKXcTmNSqdZ+/DC2xEkEzu3JnMvQfYw=;
        b=DDjYaDQkQGuBdZxcVS16eTyJJXgq8KoxFsU+6dCI/QMQWZxt7SSssPZJ3eYDReMhVK
         PZt5OD/kJvX/xC/iCvn+/rq/LajV18IJiNSly7DSNCY7WAS3jT2oxIKKPKOwT4LocnmQ
         WbjDTTx6zkq6aq1w9q9oz3V0rBOlov0qz1QVm8yOOhmHM8t8Q0UhpbWi+VKRNfJHUboA
         HymVnlqU5pUmEemIfKEl9rjHRguLoihapgcKlYIDirjniZTxpJkI5y98sVYOI44FxCEI
         2pauQBlPRFeBqKOqtZEM2/J93IdU0oTIinRAO2GU4t5sdPowNt5J1Ixa8kF2fYbzQDVp
         L8oA==
X-Forwarded-Encrypted: i=1; AJvYcCUSTi2NO+4GZGXALlPHLpYGWEFESmcDMZSmh3jEeGTYuggpbPGqLWdTt9jUYntzq3sh+m77ss2KayJj@vger.kernel.org
X-Gm-Message-State: AOJu0YzwtqC7hJ7jJ0Ws6QSKcdljmjGcn3cechYucmKy0qEu0BXAiW4J
	hjJR9HjiE+nhdwodHk/WweKANYhzaxifgOEABfp3a4GST5EDYMnruvDxeGigarFcBQYA0TJlDCW
	1JOKM7xpvftUt+ccSnL1vcgvtTx0p/w0Qx8R5y/ptRg==
X-Gm-Gg: ASbGncsObRzDRKij0CNTdtlqhEmmaGUsHdeIIKXEQuKfWtpvl5q9L1+/qN0qf77FKQd
	ar91rVmlJV1rXigQqi7IenO7q/RqZDrgFHlJ2iGlFn0NXz1P8jfdfxSKzcxoWcfon0+/YsQcIOL
	cL+eBrFOKVC3tKQ1Q6J6hJFRvNn6kaf361RSpQ/4RftF6JohkHKIXl4yzNKxo6kAPWY1TWzmBK3
	SGJHUEHIvXFdqCvd5hIleJ0iD1CIjvTZa+2J/c8Gg==
X-Google-Smtp-Source: AGHT+IGGKVZL2gi3YF6dcBpVJCqmCTegzTcKiJ9fHmRZqlNYn7Bg2+Yd24bFWr79pSRo5RVmMmRv+MnI7JAH4UVwWPA=
X-Received: by 2002:a05:690c:ec6:b0:70d:fe09:9b18 with SMTP id
 00721157ae682-717d5c373a9mr204630517b3.2.1752484600812; Mon, 14 Jul 2025
 02:16:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250708-leds-is31fl3236a-v3-0-d68979b042dd@thegoodpenguin.co.uk>
 <20250708-leds-is31fl3236a-v3-2-d68979b042dd@thegoodpenguin.co.uk> <20250709-happy-gazelle-of-fascination-fe0fd4@krzk-bin>
In-Reply-To: <20250709-happy-gazelle-of-fascination-fe0fd4@krzk-bin>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 14 Jul 2025 10:16:29 +0100
X-Gm-Features: Ac12FXyAnSttrQTxfZ3hyjQUCceH_uU_FETUA29_qdO6yKKW6bWWhuKLl-Sbr54
Message-ID: <CAA6zWZKRA2Qn3ajN9f9o_oBTZAgrx22gP28A5CHgx=+0jFrOKg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: leds: is31fl32xx: convert the binding
 to yaml
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, 
	Lucca Fachinetti <luccafachinetti@gmail.com>
Content-Type: text/plain; charset="UTF-8"

> Driver as Linux driver or LED driver? If the first, then drop.
LED driver, might not be obvious, could change to controller,
however the datasheet refers to the device "LED driver".

> These should be people interested in this hardware, not subsystem
> maintainers.

I will let maintainers decide who should be included here perhaps ?

> Keep consistent quotes, either " or '. You made different choice for the
> same properties even...

Copied over from original poster, have not spotted that before, thanks.

> Pattern does not match entirely the reg constraints. 36 is 0x24.

Pattern allows for one or more hexadecimal values starting from 1,
so the second number should start from zero is the second error here.

Thanks !

