Return-Path: <linux-leds+bounces-2779-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB9897D635
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2024 15:36:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E242285DA3
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2024 13:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC365178378;
	Fri, 20 Sep 2024 13:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oI3yXrZX"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F88F158DB1
	for <linux-leds@vger.kernel.org>; Fri, 20 Sep 2024 13:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726839402; cv=none; b=WbyiwPeApzE+3XQdkS1ZfRSBKEZKTnOv8JTdlynNi4otQxnVhKaCjvQRSKFJ+cTN7Yz/uz4KQo4VfCyuJgW45laUS1uWy2hLczAvJkVGMGZ2Z3X+0c/J7Y+t/jE6yHZabldkICVR8mn+UulU6wX6IK/nhTMa20puQE1y619bdm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726839402; c=relaxed/simple;
	bh=JvX86XJgCRYYcyM726NTaN9hhTnAJ4K/UyW2ajC3ZH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cRjX7HBICVQGTfS4J0WQG/gR4ed5er0Qhl7N4q01AjRCfBjaOfFqdJ6s1HwSsWFJMsodXGCl+7rrBaT2J7YJUSwoNP5v65RT5Udoo55g4wUgslo2gQYJDM1b1jdgdT8tlcDsh8y8iOYalcdwVWHCeZLsEYz1n5Qpk0rI4V2L5v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oI3yXrZX; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53659867cbdso3205879e87.3
        for <linux-leds@vger.kernel.org>; Fri, 20 Sep 2024 06:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726839399; x=1727444199; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JvX86XJgCRYYcyM726NTaN9hhTnAJ4K/UyW2ajC3ZH8=;
        b=oI3yXrZXrd+qlM3cvxz+cZBm1VWqtsUMdTWDJFfCmeieCaIBH7o7PYN1voOAWB1BSP
         BKBKkNE+dXkloopyrIKVhNE5AIVDSaLs/yt6wu97WFHf5ZR6xD/RARuwYWTi0KpDjrJW
         7XmAqscznshPnaSwWCF5xpmCbfeU9fERUVndd6gxg6Tp1bcGjbnjuHHKNrcg9FQnMgJg
         622ifNW+SMjNwKbR5eNRhahj+Tc6wEXqj8C88fwfZMcEoaepLSh11RR4FBbINWjeRZyi
         HhuEPRijzPMQ6arvufhq5fvt/rgg2O6hxL8JStWR3yrS6QXyWeZ03Kq63PYwF7d3CZcu
         Ibpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726839399; x=1727444199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JvX86XJgCRYYcyM726NTaN9hhTnAJ4K/UyW2ajC3ZH8=;
        b=reYTfM3KcglQyb3YymHnJTUe1aqzrx4gRdSzXsAFFfkOavAyqEq+jw996Xt32nqcNm
         Cpqmvv8CKo6CDbcdCH7QcyiJRXv6Gc/vJKcCEIpDVZ3xGlKnFY6s6QcY3JkIQ801dIEj
         /T7dmHtIt7l9xELeb5PyqPsuTVpAiwl4rU+nXaqKGclJJmbGwRIFjzXgZI3RrLCU7Ak2
         BF1eiscpb76UyeCZGcKAskQLqpJV035B4+5W8PY2mg+y6W9dsxzftsgGoi+SFVD8h7Ls
         96ZnBUOLqlrg2VGpEUjS8DhdPtXSKen7Pg/RxDOlKsys40hvPoa5mfhkKvJKh4hmQnEY
         NLSw==
X-Forwarded-Encrypted: i=1; AJvYcCU8DW0AdbfQ+ObXLDvgcZ40DBilZ6tP4QFu4RASor+t55GGjElT0Rz083FGGsBbxQJdJPUKG7aJI2TM@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd1rL55HK+QHB4xdHfJJP8hu6W3VXt+fKnZcagjN66ndf7L2gB
	78F7++3ghDG8H5GarGqTYKg/Yh8dG7906Cyw9pQ6ojt09rjnRhYNeNyQnW2n0t+pqnhQHyQg0jc
	5sGu1qd7VWfHiLAXkEy9WE+sBowVESm38HO82Jw==
X-Google-Smtp-Source: AGHT+IF3MXqM4AHdMsRT0X+IuAROYjzOa/eJcaWjmb2kM5RxfqdyUYT97T2lTKxU1txf6kHpDxbFL++mBvZFpq5QCTA=
X-Received: by 2002:a05:6512:3989:b0:536:a695:9414 with SMTP id
 2adb3069b0e04-536ac2d69abmr2693139e87.6.1726839399099; Fri, 20 Sep 2024
 06:36:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240920-bcmbca-leds-v1-0-5f70e692c6ff@linaro.org>
 <20240920-bcmbca-leds-v1-2-5f70e692c6ff@linaro.org> <12ea4d8609b3defa8782a37c62a22820@milecki.pl>
In-Reply-To: <12ea4d8609b3defa8782a37c62a22820@milecki.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Sep 2024 15:36:27 +0200
Message-ID: <CACRpkdZTrT-+u+Mt4ymyYxx8pR8s2rS6yfyf-11fLb-MZoMzxw@mail.gmail.com>
Subject: Re: [PATCH 2/2] leds: bcmbca: Add new driver for Broadcom BCMBCA
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 20, 2024 at 1:30=E2=80=AFPM Rafa=C5=82 Mi=C5=82ecki <rafal@mile=
cki.pl> wrote:
> On 2024-09-20 13:15, Linus Walleij wrote:
> > The Broadcom BCA (Broadband Access) SoCs have a LED control
> > block that can support either parallel (directly connected)
> > LEDs or serial (connected to 1-4 shift registers) LEDs.
> >
> > Add a driver for that hardware.
>
> There is an existing driver for this hw block, please see:
> drivers/leds/blink/leds-bcm63138.c

Gah how could I miss this ... I will test with this driver and then add
any stuff I need.

Thanks!
Linus Walleij

