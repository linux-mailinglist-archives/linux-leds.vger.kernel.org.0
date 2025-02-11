Return-Path: <linux-leds+bounces-3921-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB379A30CF9
	for <lists+linux-leds@lfdr.de>; Tue, 11 Feb 2025 14:33:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D235E7A2C9B
	for <lists+linux-leds@lfdr.de>; Tue, 11 Feb 2025 13:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52C341FAC4A;
	Tue, 11 Feb 2025 13:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wlw6Yshh"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264101F3D58;
	Tue, 11 Feb 2025 13:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739280744; cv=none; b=XJbRVSYlWr/zQRKkrgJ0eboJBLZFVXqdcJ1fFqFF8wBwRCpOfBHVblRtRIVVlWZhPZ1eJcJzfg2OkYJKlSthZyEqJJV1HeNul1lDrP5IifHQ99QOtja27Q6TUeWHQXgFgxWxrD9LieUvs3clZC7QrRtEapBN5q73j7qsnpJThSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739280744; c=relaxed/simple;
	bh=0ML6mdqwu+QYUFAwx0ZLdXCCCnCYA+w0iflWHWhRn24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UNeV8LliFULPGKbJKGeXPdPLBAeIb9QEFrNK5nBIvXnVDXdHBqzSoXlozfpPxelJKbfIUnrirbL5HVXVKNcqIwBJCWj7shB2bCzPl6yGJz1giGVEEzpkkIrvjC/rwKfnyvQ59bi8M42eDYK0mVaMsin8m+cwwcAUGnz6QdSCOS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wlw6Yshh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38A73C4CEE5;
	Tue, 11 Feb 2025 13:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739280743;
	bh=0ML6mdqwu+QYUFAwx0ZLdXCCCnCYA+w0iflWHWhRn24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wlw6YshhbdPv3S0jvOC8NiICWTX/yE9S3Igbutd578MzNTN1HciR+hXqCsPixcr2F
	 cBvrCcd4WB/dhU52ITSFFhzytW6VKjzlq0WLm69ReJGtTyCjPv7iLsu2Npy+ql5gmD
	 BHer8TS6pOBdYmFaHaqIRDtRRs73/OjYJvPcbZHMMamU3gfaTG8TVk0hjXd2FQ47tn
	 Ia7aqx9pjVKbcnJ7BrcFIdjjrLjBVA7XJul6ePztiYHbyoy0F1/Pdz2LkL2DAMetGn
	 5Oyaqi7Bs7VPhh+d1CrlneqqaRZUtWpQ0huD/ALG/TLbyuFKvJHoM+eZHGBM0CHROT
	 ZaTZaduGYWPcg==
Date: Tue, 11 Feb 2025 13:32:19 +0000
From: Lee Jones <lee@kernel.org>
To: Manuel Fombuena <fombuena@outlook.com>
Cc: pavel@ucw.cz, corbet@lwn.net, linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 2/5] leds: leds-st1202: initialize hardware before
 DT node child operations
Message-ID: <20250211133219.GO1868108@google.com>
References: <CWLP123MB5473933B9B97137828ACC6A6C5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
 <CWLP123MB54732954D59EFDB0D344A6DAC5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CWLP123MB54732954D59EFDB0D344A6DAC5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>

On Sat, 01 Feb 2025, Manuel Fombuena wrote:

> Arguably, there are more chances of errors occurring during the
> initialization of the hardware, so this should complete successfully
> before the DT node childreen are initialized.

Okay.  And you're sure nothing in Setup needs the DT info?

> Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
> ---
>  drivers/leds/leds-st1202.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index e894b3f9a0f4..927874f20839 100644
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c
> @@ -348,11 +348,11 @@ static int st1202_probe(struct i2c_client *client)
>  	devm_mutex_init(&client->dev, &chip->lock);
>  	chip->client = client;
>  
> -	ret = st1202_dt_init(chip);
> +	ret = st1202_setup(chip);
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = st1202_setup(chip);
> +	ret = st1202_dt_init(chip);
>  	if (ret < 0)
>  		return ret;
>  
> -- 
> 2.48.1
> 

-- 
Lee Jones [李琼斯]

