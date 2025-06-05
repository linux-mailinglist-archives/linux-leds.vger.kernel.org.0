Return-Path: <linux-leds+bounces-4744-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CC7ACEA6F
	for <lists+linux-leds@lfdr.de>; Thu,  5 Jun 2025 08:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1090E189B1AD
	for <lists+linux-leds@lfdr.de>; Thu,  5 Jun 2025 06:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10A411DED70;
	Thu,  5 Jun 2025 06:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="LI9scScH"
X-Original-To: linux-leds@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060571A00F0;
	Thu,  5 Jun 2025 06:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749106122; cv=none; b=PDDkIVIy7+Ihc18L2T8+Gv450pVK1QXKyEIm/dn9ZF05/KbIW6SGhsiRFnpyJvcCSfR9mxWamQludZrkkTHlkuseFCCAZ5uThiq8XROav/V9vr+8i038eUH3/F/1dC7JvoLHHo9g2Smw9UT4KyXDP7uUXvzIJgTXBXX0MThoGDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749106122; c=relaxed/simple;
	bh=v1VbwHn9X/vcgpehSlsORSX2h1I1ZC7wmEKLIY4Dtio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y6y3EVDFQbadbw1XuShlyU87tA5XntbN7QmxA3PLbrJWAWjs6CEgc1+wRCftE4eOhj5oAoPrBcVPmWYCi9Te+4TAmOnmo34I6sun+ZZQUmG3Kec609x0rxaHj0b4GngLjh+uLpt/XJIQ4ReuDQpXrldGa27C8IAjZcpekGAjtSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=LI9scScH; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=vw3Uk3105LnqEXM8kkjyZCQuG6ZyTrE+YY65qSzjcI0=; b=LI9scScHpRzQVwEG4A4uDjhr49
	6LbDw9dbugxOSGcz/8BfYC1xZqGbW8II8ipnio9no12FR8hV8l9NPyW8nxD4pNvPaxFRt9IN9UTE2
	7uX122hebeivEf4yr/bsLoXxhYxV0VZrMwJkZw1LBOMDUdvINYVQ6A7grHBq5G71yEMw=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:62185 helo=[192.168.0.218])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.93)
	(envelope-from <matthias.fend.oss@emfend.at>)
	id 1uN47t-00BsXS-Cj; Thu, 05 Jun 2025 08:30:57 +0200
Message-ID: <ea382833-3782-4203-b31c-7f1a364f671d@emfend.at>
Date: Thu, 5 Jun 2025 08:30:55 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in TPS6131X FLASH LED
 DRIVER
To: Lukas Bulwahn <lbulwahn@redhat.com>,
 Matthias Fend <matthias.fend@emfend.at>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
References: <20250527065434.202622-1-lukas.bulwahn@redhat.com>
Content-Language: de-DE
From: Matthias Fend <matthias.fend.oss@emfend.at>
In-Reply-To: <20250527065434.202622-1-lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 

Hi Lukas,

thanks for the patch!
The filename changed during the review and I actually forgot to update 
it at this point.

Am 27.05.2025 um 08:54 schrieb Lukas Bulwahn:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit 0d12bb1a7fb6 ("dt-bindings: leds: Add Texas Instruments TPS6131x
> flash LED driver") adds the device-tree binding file ti,tps61310.yaml,
> whereas the commit b338a2ae9b31 ("leds: tps6131x: Add support for Texas
> Instruments TPS6131X flash LED driver") from the same patch series adds the
> section TEXAS INSTRUMENTS TPS6131X FLASH LED DRIVER in MAINTAINERS,
> referring to the file ti,tps6131x.yaml. Note the subtle difference between
> the two file names. Hence, ./scripts/get_maintainer.pl --self-test=patterns
> complains about a broken reference.
> 
> Adjust the file reference to the intended file.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Reviewed-by: Matthias Fend <matthias.fend@emfend.at>

Thanks
  ~Matthias

> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e20de38ffa54..0c4f0eb7f49c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24518,7 +24518,7 @@ TEXAS INSTRUMENTS TPS6131X FLASH LED DRIVER
>   M:	Matthias Fend <matthias.fend@emfend.at>
>   L:	linux-leds@vger.kernel.org
>   S:	Maintained
> -F:	Documentation/devicetree/bindings/leds/ti,tps6131x.yaml
> +F:	Documentation/devicetree/bindings/leds/ti,tps61310.yaml
>   F:	drivers/leds/flash/leds-tps6131x.c
>   
>   TEXAS INSTRUMENTS' DAC7612 DAC DRIVER


