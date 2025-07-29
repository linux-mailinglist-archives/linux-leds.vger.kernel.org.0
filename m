Return-Path: <linux-leds+bounces-5164-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E06BFB150D4
	for <lists+linux-leds@lfdr.de>; Tue, 29 Jul 2025 18:06:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 472821883DDB
	for <lists+linux-leds@lfdr.de>; Tue, 29 Jul 2025 16:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D27B121E091;
	Tue, 29 Jul 2025 16:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="p8ulU+Nf"
X-Original-To: linux-leds@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B7810E9;
	Tue, 29 Jul 2025 16:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753805164; cv=none; b=QWnBd0ppu4Vc9KRiBqls1LcVjD7nscULxSRLZm9VCXCyUbrw+QwsL2uBTC6OPL5Jh2gB7kKTROcXRnFommMRuft5dfHEA8bvauuvbwsBRM63KN2Hx46OqYUSy7VIE+/EE8yjVPyNndjhG5Fn+wMmLKVEOCE4OegnpkYHDmEtcTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753805164; c=relaxed/simple;
	bh=CpB8GERMfYRs0+4ZAgyTxuIfXpQluNdMs0VJWf7CkzM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=kV/TKacs3Oo3FIZfzUtmikGd5W4puyyD6ralS3YVos9JIm9l49fwtQFHKedzkl7xJ9wQChUrMVJkuvbwp8ICOWLaW+ivwUEzZxBlOJdPIWJXsNMh/5bRQ/RI86/u5MYQwVuU4f7i37OuazJVxZmWcgpPUcP4KOAU9gm7Mvm3SpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=p8ulU+Nf; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Vj2Y5Htk0TdwQIPD29EKrTANnYA57kMQx2/+EiD5PZA=; b=p8ulU+Nfn7Z+lRd63HWUpZDRGu
	3clUC0Bin8TVQ+eSuOwAVxh0/ug/HmZXpgolSMwzSQWgEO6xUFB0TEI5zTcAI5LCX2NDMn5Ck2JV9
	p27oo3x2F8BM8zfzMD9+X15imt5minFPXuIBDyd1h0dbj+Rv/89ICAqkibrH+qblBRmrfRhlYfMSW
	1DpcywvrUhRCZfj5rXtPqX4xOMx5KzefKZ7a3g3iNFWKa/0tHKcnRr9cYNdamQqJGcm//a664JS/5
	vsuqTgysPb4stxN6Q5UY9epYGFcW7uIJOiq3AccMZhVDF/MEeVTehuzyVKzL1qxgNn/JkEodzvOOi
	lXc7ihjA==;
Received: from [50.53.25.54] (helo=[127.0.0.1])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugmpv-0000000CefU-29Dl;
	Tue, 29 Jul 2025 16:05:56 +0000
Date: Tue, 29 Jul 2025 09:05:52 -0700
From: Randy Dunlap <rdunlap@infradead.org>
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 linux-leds@vger.kernel.org
Subject: Re: linux-next: Tree for Jul 29 (BACKLIGHT_KTD2801)
User-Agent: K-9 Mail for Android
In-Reply-To: <5002743.GXAFRqVoOG@radijator>
References: <20250729153510.3781ac91@canb.auug.org.au> <b6c481bb-e854-405e-a428-90301789fe20@infradead.org> <5002743.GXAFRqVoOG@radijator>
Message-ID: <B2E29C08-674C-4D8A-B187-7F6A6B5DC76F@infradead.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On July 29, 2025 2:18:16 AM PDT, "Duje Mihanovi=C4=87" <duje@dujemihanovic=
=2Exyz> wrote:
>On Tuesday, 29 July 2025 10:32:13 Central European Summer Time Randy Dunl=
ap=20
>wrote:
>> so BACKLIGHT_KTD2801 should:
>> 	depends on GPIOLIB
>
>Sounds good to me=2E
>
>> Also, in drivers/leds/Kconfig, does it need duplicate entries for this?
>> Can't the second entry be removed?
>> (asking since Duje made both entries)
>
>That's an oversight on my end, and as such the second one (the one inside=
 the=20
>"if NEW_LEDS" block) should be removed=2E
>
>Would you like me to send a patch to fix these?

Yes, please=2E=20
Thanks=2E=20



~Randy

