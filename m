Return-Path: <linux-leds+bounces-5160-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7885EB14A26
	for <lists+linux-leds@lfdr.de>; Tue, 29 Jul 2025 10:32:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9C063B15D9
	for <lists+linux-leds@lfdr.de>; Tue, 29 Jul 2025 08:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E979027F74C;
	Tue, 29 Jul 2025 08:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Sf+9n6uc"
X-Original-To: linux-leds@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5630D188006;
	Tue, 29 Jul 2025 08:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753777938; cv=none; b=qYZocBt4VADj29KGsPjQO2Jys6gm2JqPV7xwov1+wH1Od5RYlJOy8AuIEs7edpAhCPs1YesUmAbfeHtKfspVj8z9q/YnQ2SD8LtKSCkVyaA+MKJWwavPKBQdbPKpqNn774GnfsJq805dK7lM5gc4wNcVpzpQKtaWlJl9Iv4ZnOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753777938; c=relaxed/simple;
	bh=+XABJZ1Y+l4x9gpWb/ZBne0JFnnqqRxCjQW8cw5+ybk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jCjSfIr80oFRTV1vohmfsUpAExvj/XAOjn07gafYR3DThtoWPG5jHnuyEnfydxjjFwTAWnPTClgrKL2ZeYZ/W5p2LfxbF1z8qVpkkTQrF1CyaP473hvKUeygKaSnwSawCwnso6pTKRTi2QcSDPqPP7Pl7CZuQMn9GKH10HXDYbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Sf+9n6uc; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Ny6TTgLU/SMwi1VgsRmQeRrVFh08FienZHwG6QcdxfU=; b=Sf+9n6ucYRkz2uSDSDBZF8BxDS
	guhE72SQVW+BZV1de/8bXrTpgFKrpGF0+y91PVKs/QQXe4hLbl3bCKOdCmjRMSlxtYrRJz/J098xs
	+eHk0Q2Bt5eoH6kSXSE/SVC1/kLm/LIfIiGbjEwnPbw+e+MeMYM15bqOe6YqryxU5CRP2Wx6lWYia
	xyfQM3BhKqlLuKeddSYad4uuUDm9NbjpeoV9nBJfXHzQu/3xYHGn3McXhWJyVyj5xgqQb/ogD6q6R
	S1twO3QfWRK5Mh3D0i/NVD2BtvbtQglFV6h4zwk3dFNKbJ4n2vEBxU+bGdmlxXH8zw0JZ7Z9nczkk
	wltECnBQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugfks-0000000GGM8-0wb6;
	Tue, 29 Jul 2025 08:32:14 +0000
Message-ID: <b6c481bb-e854-405e-a428-90301789fe20@infradead.org>
Date: Tue, 29 Jul 2025 01:32:13 -0700
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jul 29 (BACKLIGHT_KTD2801)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 linux-leds@vger.kernel.org
References: <20250729153510.3781ac91@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250729153510.3781ac91@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/28/25 10:35 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20250728:
> 

on ARCH=um SUBARCH=i386, when
# CONFIG_GPIOLIB is not set

WARNING: unmet direct dependencies detected for LEDS_EXPRESSWIRE
  Depends on [n]: GPIOLIB [=n] || NEW_LEDS [=y] && GPIOLIB [=n]
  Selected by [y]:
  - BACKLIGHT_KTD2801 [=y] && HAS_IOMEM [=y] && BACKLIGHT_CLASS_DEVICE [=y]


so BACKLIGHT_KTD2801 should:
	depends on GPIOLIB

Also, in drivers/leds/Kconfig, does it need duplicate entries for this?
Can't the second entry be removed?
(asking since Duje made both entries)

config LEDS_EXPRESSWIRE
	bool
	depends on GPIOLIB


Thanks.


-- 
~Randy


