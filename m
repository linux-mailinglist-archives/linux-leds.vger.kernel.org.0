Return-Path: <linux-leds+bounces-5334-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61088B3DA7C
	for <lists+linux-leds@lfdr.de>; Mon,  1 Sep 2025 09:00:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14F943B7A04
	for <lists+linux-leds@lfdr.de>; Mon,  1 Sep 2025 07:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 062A52264D4;
	Mon,  1 Sep 2025 07:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b="Sd9lNMmk"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp1.ms.mff.cuni.cz (smtp-in1.ms.mff.cuni.cz [195.113.20.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB1818EB0;
	Mon,  1 Sep 2025 07:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.113.20.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756710025; cv=none; b=iGW7RUvzIutjjE+WrjGH/dG5uK+rUT96tt2pfONE0RGug+Yd0POo6+y2WXLh7qkgPPbkCLhfdQsTvPjABduR6ZwNBbJrOys4TSpgsFUaWHE9lSrS1IbAlsNqRW1krmQ9hNm+WO3o+n/aLH3yh/H9FczEN02b3IOHi2U6pJUqABo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756710025; c=relaxed/simple;
	bh=T77wLKep9TN1dpgaCJlNIMuLVIcZqoBipwx/oqWY3oU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Cc:Subject:
	 References:In-Reply-To; b=OO514a1zCujkiWj60p18aIAZe8A9TTIPjBacf7yBCF6+VB8uENk7fP93FxoK1S17zf505dUvkESjIowijs1AopR7PLg/eoJXRTI6a560gugZwp41AG/OAm+E+4CJJ69esOHAYrC7KUt32Q3UA4Ce8j2Qrluzx+j7/AFWtR9qZzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz; spf=pass smtp.mailfrom=matfyz.cz; dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b=Sd9lNMmk; arc=none smtp.client-ip=195.113.20.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matfyz.cz
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1756710004; x=1758010004;
	bh=Un5NzRBXxo7jb6yE4rBxZ6vn2fMVF61fK7oD1x4DVyI=; h=From;
	b=Sd9lNMmkKLgpeUT6AqcYGk+b6OQMvMsEg38pyUCJZ6C12F4xj+HO9gSdu3Jqfglsf
	 LtjqgHRk/h2AAqo7QlZUcYBis6PXxt6+XNZSIQtJf5n6lb1x7BlXuSIcEoP1gcoxog
	 hyemmiHKrZPgX1XQNbJ9I+3MCTpku1wI9EDXGXPwZXNeYqcq2gqqs8kkbHBM79fp+1
	 RY109HnVjPbN2kHYSF+gFqwbOnHuLe2545sAWalU1ZJ5m7sDqRbzgb1Bpyu9FKHM1q
	 f098ddrD8wMxi2bHifzK4+Rcd3f55Ngy6NXoXuYiA9Fnd8jQcQVLH02QsxLO5lRqBn
	 RosMO9J9xmKUA==
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 581701YA049795
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Mon, 1 Sep 2025 09:00:03 +0200 (CEST)
	(envelope-from balejk@matfyz.cz)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Sep 2025 09:00:01 +0200
Message-Id: <DCH9Q1LKBCZC.2ZV4J0Q6AZ4KI@matfyz.cz>
To: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
        "Lee Jones"
 <lee@kernel.org>, "Pavel Machek" <pavel@kernel.org>
From: "Karel Balej" <balejk@matfyz.cz>
Cc: "David Wronek" <david@mainlining.org>, <phone-devel@vger.kernel.org>,
        <~postmarketos/upstreaming@lists.sr.ht>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] leds: expresswire: Fix chip state breakage
References: <20250829-expresswire-fix-v1-1-f8c8c6ad6c5f@dujemihanovic.xyz>
In-Reply-To: <20250829-expresswire-fix-v1-1-f8c8c6ad6c5f@dujemihanovic.xyz>

Duje Mihanovi=C4=87, 2025-08-29T23:08:30+02:00:
> It is possible to put the hardware state of the KTD2801 chip in an
> unknown state by rapidly changing the brightness for a short period of
> time (for example, with a brightness slider). When this happens, the
> brightness is stuck on max and cannot be changed until the chip is power
> cycled.
>
> Fix this by disabling interrupts while the chip is being programmed.
> While at it, make expresswire_power_off() use fsleep() and also unexport
> some functions meant to be internal.
>
> Signed-off-by: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>

You could also add a Fixes trailer and Cc this to stable so that it gets
backported correctly.

> ---
>  drivers/leds/leds-expresswire.c  | 24 +++++++++++++++++-------
>  include/linux/leds-expresswire.h |  3 ---
>  2 files changed, 17 insertions(+), 10 deletions(-)

I have run this on samsung,coreprimevelte over the weekend and haven't
observed any direct issues with this. I will note that I've had the WiFi
fail to load FW two times while I haven't had that happen to me for
quite some time, still given the nature of the WiFi issues, I believe it
was just a coincidence.

Also when I first loaded this, I was still able to break the chip once,
however it's entirely possible that I just copied over the wrong version
of the module and after a fresh full installation, I have not been able
to reproduce that.

The "laggines" this introduces to the backlight slider is noticable but
pretty much only when trying to change the brightness back and forth
very fast which isn't possible without this patch anyway because it
usually breaks the chip.

Tested-by: Karel Balej <balejk@matfyz.cz>

