Return-Path: <linux-leds+bounces-4880-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F010AE7E72
	for <lists+linux-leds@lfdr.de>; Wed, 25 Jun 2025 12:04:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 052C9188F45A
	for <lists+linux-leds@lfdr.de>; Wed, 25 Jun 2025 10:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D04B239E75;
	Wed, 25 Jun 2025 10:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="YkbULyfQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC182877DC
	for <linux-leds@vger.kernel.org>; Wed, 25 Jun 2025 10:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750845841; cv=none; b=uPhL8YWp5XHtwXDRZ9IEMz4pAJPqWKdTtmLSFpTtgCJd9TXnJjB7oXQUaTlTfYn9uKQCndHuNrABP7wT1yAtnUOcOK6lCu4v2NjAxXAYlxxctnNoRMwBUMHTkJrtSKag3hB6bVeDo9qYwMAkTD3SedLfB5uFMoFEfSxiw54UjtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750845841; c=relaxed/simple;
	bh=InSUgMHj7YHgTuK0vIoROW4E7TROq3+bMfdtasJvirE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C5lEc1C4iIYVMNMoAX3Pf4/aqcajDpy2yUreVCfzrW/7waY36eeBhDiKTYH0h7xGu7mxqVgEk8+gdX4xDjugzH0miqCtlQq1BXVmSlwWpHMaTcDhgbEnxzoyRvvY1s+OsiHySWcHnoGsknAbkre3w/MkXb+6wbGy58UfmDVER7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=YkbULyfQ; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e8259b783f6so5422090276.3
        for <linux-leds@vger.kernel.org>; Wed, 25 Jun 2025 03:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1750845838; x=1751450638; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kmD44ihmlKCIEFw/Ec57OTgJaz5T3CrTVgvgiR+PjCI=;
        b=YkbULyfQf74JrjTUSbvCT1iSjWpUX3VdAYJHl1vCrbDz2PvlB6+2v1Rq3ztif/tbxs
         Eatj0/WNHxbhFd/iKIrocRl6fgOW1c9rTzswHRzTy4yHC/efRet9h+MdboGThNk28hMX
         3IcbhBbHiBWEj58tr4d2N89qK/j6q48ECdfz4oTMAB3dPPrxMvnLkXjOcFkYZkD97Zr+
         D3+8yGbC06kLq7ff0/FGvM2cT87SP+ITHV7Czr1VFXkyLBH3blKScKT6zCfAdg1F2QZN
         Wb1wFivEnpLcpoToTc5dk3ZH4Anc3ogpYmn+vcue3O64dRBGV9XjsEt9Ot6WJRJCYg2k
         F9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750845838; x=1751450638;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kmD44ihmlKCIEFw/Ec57OTgJaz5T3CrTVgvgiR+PjCI=;
        b=w7XUhaNdDsLNxofzoQbh0QisfJZSp9zdsbL62inEft8ntNpj/9/bheRz2fAraMxaln
         FSsOKtvL6UJ9r5pYDIFGmgy7H9p+UnY/L6rtXmcnVmBLabhkl3YKVJb9ZMm7GSdSlKyA
         3Xg2nfLGEIaCnxc4Qq92dRjDqb7jSMaRmNCp2ZAaGnOvDrIclIaxrNmxSnaIm3YhXE3M
         9rSf2191ZhHDpuZ4TgnzaSuD4/0hKTnILf03ybige1mKN7zmaJ8dRssA5Lg1TZjKsoyA
         wvio9X9HtNkjcfmP5avLks1UIT6L5Dd0iQeN9U4kwxbDoK5Ie7SWmdOR73uRr5hiWQAI
         iV/Q==
X-Gm-Message-State: AOJu0YwU8v6mXZdB+m1DdhKIaZw+pnUTWtj/HUCS9twtoaVs+jY230g9
	jg/XCR43nv5Spgrj/A9BfGZ0AQLIFub6xHScYFA3OZlH/4ktaoxXcDCngmZgrvyolhFjeWPOdWg
	tm+wpNrgI3mVSjmf7USbgiFpPFHeWzENj+cD/S+3f62p623Kf9bRNokK5UQ==
X-Gm-Gg: ASbGncv+c7bscVzUxP6PczKqOmdNcCAPeDE0IgBkUUd9XeXq2vuSgpqfQrqiH6DPOOu
	TMKohVcV/W4O3JimWhoymF550cRHSBfP3/J9D2iDDmUy6LeVJBRjCeNyx3ezkXpb9dhn8Iwh1bj
	boc3VwUEdDJqRlSHLu7EJPfgczpMD1l2trA7KeZc49bH/cshHnXIyh6zFDJDO0YQztupvBw8GWY
	SDsElmLHWM1dnkI
X-Google-Smtp-Source: AGHT+IGWK5Rj2DKF48pf43KvWRmK95txvwjHLVqw5toT58PGLzU2Yp/MFrUPuixMNOOtL+PeSM4Uoi+KQgpxeU1ImjE=
X-Received: by 2002:a05:6902:200d:b0:e86:93:d4a5 with SMTP id
 3f1490d57ef6-e8601745c86mr2544428276.7.1750845838219; Wed, 25 Jun 2025
 03:03:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619142233.653273-1-pzalewski@thegoodpenguin.co.uk> <20250625091935.GS795775@google.com>
In-Reply-To: <20250625091935.GS795775@google.com>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 25 Jun 2025 11:03:46 +0100
X-Gm-Features: AX0GCFuisfZAQxWb20sI5wxg-Bg7anH-iDTxHQ-Tjv9mqlRYp7GuJlYNiqztyMY
Message-ID: <CAA6zWZ+TbcHrZaZ0ottm0s1mhCLa8TXASii47WKSLn2_zV95bw@mail.gmail.com>
Subject: Re: [PATCH 1/2] leds/leds-is31fl32xx: add support for is31fl3236a
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Line up with the others please </ocd_voice>

My tabs were not switched to 8,  checkpatch does not pick up on it,
realised after sending the email :)

>  How do you sleep at night!   =;-)

Ah, not much sleep recently !

>  Please the '&&' and the end of the previous line, then indent this one.
>  Line-up with the '('.
> "PWM"

Thanks for the review, will do all of the changes in V2.

