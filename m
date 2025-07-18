Return-Path: <linux-leds+bounces-5091-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF68B09BB8
	for <lists+linux-leds@lfdr.de>; Fri, 18 Jul 2025 08:51:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB3ECA653BB
	for <lists+linux-leds@lfdr.de>; Fri, 18 Jul 2025 06:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A66B1EDA03;
	Fri, 18 Jul 2025 06:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="JAGrEzdb"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C731FDA7B
	for <linux-leds@vger.kernel.org>; Fri, 18 Jul 2025 06:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752821465; cv=none; b=qU6gwfYXNRTYjoAa+feOPfNV94uv80gUV2CITyOE6YHfvgn1/nS0Gq4Et/E2relFMkzkm/xqU39fvAxBUXIlyQmAeZkssCS+FSw4XSnY12zw9MJPOV5YJ5JBRewiVZf9B5jZ+RiAbpFAEn8GkMiAvsUFDa1XYVcXOg43r5zu5Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752821465; c=relaxed/simple;
	bh=g/bQDA1SnPganh7SgBzzVaHUvhqJSHOBmAGh77R65Yw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GT7MdJFUdltbIladpQhabncUAzqBAXTS0Fu9a5DnBZ1eD+YYoC23P3E57kCFnHD1m+OK8IUhgn1GDmozNEzNI9AOAlkF5muJxkzWvVqOJa6RWeBY3M9e1Yl1FizKAi4O8avLEB+P0CiMG3JdTEmfHkbF73bl3RiuncnRCgVk67U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=JAGrEzdb; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7183fd8c4c7so19379817b3.3
        for <linux-leds@vger.kernel.org>; Thu, 17 Jul 2025 23:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1752821463; x=1753426263; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g/bQDA1SnPganh7SgBzzVaHUvhqJSHOBmAGh77R65Yw=;
        b=JAGrEzdbtOP0h1PRv0Km8fAsJvOctpoYha5dO1N/Tq95l0YwCGsR8vbz4vnI7Lkp/F
         vuSIzqEdp55gI1ifAzcgS7kB9QhS+xw8avwIhZsdQe436XfE2CKQmlkXySKHkBDR2THo
         9Wjp3jjWnlEZOaQuXNkt0Jvqtnq5ABktCQh4644+kc8+LjztsLQsY830rp91i8Dyee6q
         awW/ntnCGPJ9fqwt5t/F16c9ejRrzP/bLHQgohHSF5eLz1HR2Sb0cuw1qegmjqp7nWdb
         mJJmcjVvEIM+IiLJ1YhNItdb+Gh6cUGlS17YwxzBy30ctwCHaHx/ExFg+lve1nlZ0fWY
         JsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752821463; x=1753426263;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g/bQDA1SnPganh7SgBzzVaHUvhqJSHOBmAGh77R65Yw=;
        b=q56NJ6dE2XryFHJiWrtZixHm/ugcEZGHxHI46bfKENgu/iU8/mfOEJxZLIKwUXpXXN
         5AKYRZ6U0E1LnxXtG8qlhziask4rNJQoi4Qh5sVIAzEH6E36u9+dmNYctafJQnVNIgL5
         I36hMT/6m19GClNfX5hgzw5YR5nFS6uWeHzZizI9TIhiZE5Etncm8MvrNUR0aA5Sf5Ei
         SPl8I/u0wmPBx8fIvkNoRpU1KIvwmyY/S6S8TSQeOHGhphWGlsznezidmFWB1pbl1lCi
         dd4yvho4tncqWL+UvJTaKhfV6r62c+dM2axPG6v8fuIMQUH7EUHB5sdzEtnnCKlnfjFW
         ARKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfALQlJRxtN4I2rWufrhJ2uWPFM3xDdtxyhXDyjUKmniw+udf2M9hwUiMO+eUnOtl597+/c91Qyvdj@vger.kernel.org
X-Gm-Message-State: AOJu0Yys21RFF0T3vuBIFq0G2uAdx4vctiweft+Us17oYI5J315SLbym
	1eIQIGWNYEXaFKoNPeXJSayN015dG7y9WUVkr+A78nraYnqsMmq6N3YhSQdy7AoV1dMuAS5to7K
	LL6tOppJPXXgfn+6fdv0XN/PwLMc2jTYB/B6ICX34Yw==
X-Gm-Gg: ASbGncuUgisk/lOCZwMNat6NmAhEbpEfosBqxHsR+AdavKAI+gm6uN3iIGlknDOMeWY
	QY7e3J7Wr/etScpCg/8QKriZTGXA1eJ2O52PrP0ax72DuSDKOvehJaGlp1HQGGQy6Y86xcOsCYr
	MVIFUny6Xzn3aI4dSMEFiIu627kC8Qegof9/+YyH57BL2G7wsC1OOEiumLClLYBzQ3XpvpO/nxK
	/92u0cyFkkwxS9oRKLJ3ngUOIIHMwcgzvV+UCjs6g==
X-Google-Smtp-Source: AGHT+IHB4qPnBvPHuDyr/eRkdonIFJaeMa7b2rimTenEZDBBnypTUT8n4v6UW2cImWERDStmN+Jv4as8F9bxbMRxZ4Q=
X-Received: by 2002:a05:690c:3605:b0:70e:6105:2360 with SMTP id
 00721157ae682-7183747508amr140109917b3.24.1752821462689; Thu, 17 Jul 2025
 23:51:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250717-leds-is31fl3236a-v4-0-72ef946bfbc8@thegoodpenguin.co.uk>
 <20250717-leds-is31fl3236a-v4-1-72ef946bfbc8@thegoodpenguin.co.uk> <175277045533.3779995.9523277801474945480.robh@kernel.org>
In-Reply-To: <175277045533.3779995.9523277801474945480.robh@kernel.org>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Fri, 18 Jul 2025 07:50:51 +0100
X-Gm-Features: Ac12FXwhPQLDpkdyogiRsJ5pr_q3LrxdRNUyRuWOgCuv_ynEzoEm_EA_gQ4kNk0
Message-ID: <CAA6zWZLyUt9X4+dAgYBVGqdNchasJorWhNH1O1Ti=UBO-J6q9g@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: leds: is31fl32xx: convert the binding
 to yaml
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Lucca Fachinetti <luccafachinetti@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date

Hmm interesting, I did run it, have yamlint installed and see no
errors. Will upgrade dtschema and try again.

