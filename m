Return-Path: <linux-leds+bounces-5161-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 442A5B14B0E
	for <lists+linux-leds@lfdr.de>; Tue, 29 Jul 2025 11:20:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FACE18868E1
	for <lists+linux-leds@lfdr.de>; Tue, 29 Jul 2025 09:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7736D22B8A5;
	Tue, 29 Jul 2025 09:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dujemihanovic.xyz header.i=@dujemihanovic.xyz header.b="sNATE1mm"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx.olsak.net (mx.olsak.net [37.205.8.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4586022538F;
	Tue, 29 Jul 2025 09:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.8.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753780802; cv=none; b=XJKl9wlryHMBXVBAY/WMbnIbFp+qM+XyOqgijfi75haRGZrGFJnd5TJznF/kBRQZWIQAFr48Hu38sjJ5uGIJBWsr7ygaGY2l485J2JZYlFitmL6IxAAdjfoj1cH3WAHUigufWbj0C6gSO7NObgMXXlqsHxNROUwlCtoQoa0yGmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753780802; c=relaxed/simple;
	bh=nWxrqj2kUyxmcv6mdjkaK20IW4Wz6SYRTXTZnZ3Px6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q72W+lUIyROWkd0ceDfhEZKowcH3fJthQNnr2orW+lr/UpKjYxqiI7oQstnnYXOY8Ecuh4MRhfTgWwosKvGi+NyXjjOtrcRV8vsYvBYFTDtLAb3Y3VsozJVX35H1CWjdtReaFCJQGJtN7HQECHcuI4XbfdnVeW3EPen/hKqrEFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dujemihanovic.xyz; spf=pass smtp.mailfrom=dujemihanovic.xyz; dkim=pass (2048-bit key) header.d=dujemihanovic.xyz header.i=@dujemihanovic.xyz header.b=sNATE1mm; arc=none smtp.client-ip=37.205.8.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dujemihanovic.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dujemihanovic.xyz
DKIM-Signature: a=rsa-sha256; bh=0FX94LO7FBG853z0deALFB9wglwXmVAtfiI/k+zwf+c=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1753780697; v=1; x=1754212697;
 b=sNATE1mmnB27c7gYFPLV3+i36LbmX0ue9FYHXt+9JHE+vmdbMjukkICF2pWl+KBxGIGGZGqH
 9BSdoRf07MgTcGVz6sGv4Lrt5RxWVV8DZwwBKwYzzPHxVN2aQOxo6M1PIiKemN/X2o2MsmOsZuI
 jLNtltSf55f8YX1iLssgQqb4Jb7NOTOk0Ht/wr1aFStUJO6za5v0NmQP3GBPprwhNsrmwaysbGP
 R4mKd/nW0OLZBJTR+0dDg4Z6/TgeIYXI86YndlDnB/g8E8i88b1EKLb+cqq2hk+eiJK4vsaZRPR
 gJeH5ckWotsXmqXCdH9YcHu+qcDo5aMFn48TE9pehy/Aw==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id 5e0832d2; Tue, 29 Jul 2025 11:18:17 +0200
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <duje@dujemihanovic.xyz>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 linux-leds@vger.kernel.org
Subject: Re: linux-next: Tree for Jul 29 (BACKLIGHT_KTD2801)
Date: Tue, 29 Jul 2025 11:18:16 +0200
Message-ID: <5002743.GXAFRqVoOG@radijator>
In-Reply-To: <b6c481bb-e854-405e-a428-90301789fe20@infradead.org>
References:
 <20250729153510.3781ac91@canb.auug.org.au>
 <b6c481bb-e854-405e-a428-90301789fe20@infradead.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Autocrypt: addr=duje@dujemihanovic.xyz;
 keydata=
 mDMEZokhzhYJKwYBBAHaRw8BAQdAWJZ0hsI/ytTqHGFV8x6tzd5sB596cTeeDB4CQsTf+wC0KER
 1amUgTWloYW5vdmnEhyA8ZHVqZUBkdWplbWloYW5vdmljLnh5ej6ImQQTFgoAQRYhBG3/QdYN8x
 S1t2umMK0xk1JFj60DBQJmiSHOAhsDBQkJZgGABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAA
 AoJEK0xk1JFj60D1GABAJVSorZdMOlrp/oQtCSH/G53NE56x/JHA8VX+ZQBd/H3AP4/EcUf6eef
 DUxVMh2bdkmuQKsVZGgOGiXpMksrVntWBrQpRHVqZSBNaWhhbm92acSHIDxkdWplLm1paGFub3Z
 pY0Bza29sZS5ocj6ImQQTFgoAQRYhBG3/QdYN8xS1t2umMK0xk1JFj60DBQJmiSH/AhsDBQkJZg
 GABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAAAoJEK0xk1JFj60Dlw8A/i4lPOL7NaYoYePDq
 l8MaJaR9qoUi+D+HtD3t0Koi7ztAQCdizXbuqP3AVNxy5Gpb1ozgp9Xqh2MRcNmJCHA1YhWAbg4
 BGaJIc4SCisGAQQBl1UBBQEBB0DEc9JeA55OlZfWKgvmRgw6a/EpBQ8mDl6nQTBmnd1XHAMBCAe
 IfgQYFgoAJhYhBG3/QdYN8xS1t2umMK0xk1JFj60DBQJmiSHOAhsMBQkJZgGAAAoJEK0xk1JFj6
 0DG5MA/iuo4l2GDEZ1Zf+XaS//8FwdXDO9nHkfbV2MHjF4NZXwAQDroMzBdMcqVvc8GABFlTTgG
 j7KrRDz2HwWNyF8ZeprAQ==
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Tuesday, 29 July 2025 10:32:13 Central European Summer Time Randy Dunlap 
wrote:
> so BACKLIGHT_KTD2801 should:
> 	depends on GPIOLIB

Sounds good to me.

> Also, in drivers/leds/Kconfig, does it need duplicate entries for this?
> Can't the second entry be removed?
> (asking since Duje made both entries)

That's an oversight on my end, and as such the second one (the one inside the 
"if NEW_LEDS" block) should be removed.

Would you like me to send a patch to fix these?

Regards,
-- 
Duje



