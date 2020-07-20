Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5A2E22606B
	for <lists+linux-leds@lfdr.de>; Mon, 20 Jul 2020 15:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726389AbgGTNHR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 20 Jul 2020 09:07:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgGTNHR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 20 Jul 2020 09:07:17 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99C7DC061794;
        Mon, 20 Jul 2020 06:07:16 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id q7so20197035ljm.1;
        Mon, 20 Jul 2020 06:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ymY7bvSHAJPgttfYe/X0Y958NcBp8ONSAlYkWgs6kvk=;
        b=Q9du8PourQ/zCbj715sh6bkHP0KiwBKVtf9jaoIN+pCmnzRhXok7nZPbYAV6MNgY7y
         GaKxflvweVHAvqaNS5DFlZA1GPN41u4di8H/uTdZKCbGZN8LEHxIjO0htBnbk+m/c+VE
         HSxImCxDS8sj4+PXqWldH0KnCpR/qYuK+abWQRJsafV7/lNdldYzReOeHW6q1Lyu7cpI
         yn9wVq4hHm/9lqCMI1+T9DJvkdNZFkWqwH26pUSAbo0hYRztU94cRavLrgKY1x73BlNy
         xeqEHzYhYm4ZuKYaLJwWpyixuTWu4dGIAUCaXYIUDX6usVVeNPnwvUrZT1W1rUCGfX9E
         twwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ymY7bvSHAJPgttfYe/X0Y958NcBp8ONSAlYkWgs6kvk=;
        b=U5ovYzjj5DtqWKtF9E7X50xGKHJrFRAVlae8Q6RP+CUGcCkPHs1DYVdnaBbt+zyvRP
         SNXxDVZEg6UKkBKKbqaQiL6wdrOGAj4G+DJEUHAYZpEwcZq3LOQSjj2vXPlI/3+xVxbc
         cmDUQ5PyOlzVSw3DqPEhvGWYtBxvlx9/sEE+Tr6HbAKbykP5oIK93kvWhvtBRczAqYHB
         5XKsZJqtiUPdv5UdLuk0l7He4Gbz8D4/8R4F7OGXV56+kpB7bmzBdoqVr3wKROP9QVj1
         GwB9wp+cd4KefcL6+9eBbhe/Ipd2pLOkJ8WQFoWv+Oo1Ca64qJaLlt43uumBmoCYDHne
         VQNg==
X-Gm-Message-State: AOAM530ONf6UBzarj5qPX6ZoT+qbW7CwaOPYoBnEEn/GA/UIhIo/PtYz
        u0i0n6D2sZamShvtj4Dmv3Ziog/36w+Xqkvpt2s=
X-Google-Smtp-Source: ABdhPJx1KQhD69pAXC6l9UhWaRZajWb5l0u55JjB5eIGKfcApbPINm/9n4ylJVwoywq1eQXFvSd3K2F6+YFWhILVTV4=
X-Received: by 2002:a2e:a16e:: with SMTP id u14mr10050313ljl.321.1595250434734;
 Mon, 20 Jul 2020 06:07:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200713134114.137265-1-gnurou@gmail.com> <20200714223344.GA20740@amd>
 <CAAVeFuKomLcAue9rGXhK3Uc=H+v9ZLBA84Ozr_rZDRQMYeC=dg@mail.gmail.com>
 <17fe52a2-73ff-b547-8a59-5df009c929c8@gmail.com> <CAAVeFuJQCp7Fpqx3nUHMy29Jw1pLNoQtxRw3qxfEf3YKnrm0fw@mail.gmail.com>
 <20200717074410.GA8895@amd> <756fa49f-bf67-0447-cf45-1358b66c40f8@gmail.com>
In-Reply-To: <756fa49f-bf67-0447-cf45-1358b66c40f8@gmail.com>
From:   Alexandre Courbot <gnurou@gmail.com>
Date:   Mon, 20 Jul 2020 22:07:03 +0900
Message-ID: <CAAVeFuLxKO9nJ+1GDuAr+-Z_BQMZpEVD46F2j=dZ3hDUv-eE=A@mail.gmail.com>
Subject: Re: [PATCH] leds: add NCT6795D driver
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, Jul 18, 2020 at 4:25 AM Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:
> >
> >> The reason for not having a function at the moment is that I took a
> >> look at include/dt-bindings/leds/common.h and could not find any
> >> function that could reasonably apply. This basically controls a RGB
> >> connector on the motherboard which serves no particular function - you
> >> can plug a RGB fan or anything else you want and control it in any
> >> fashion. Is there a function that applies to this use-case?
>
> According to common LED bindings you should propose a new function
> if none of the existing ones fits your needs.
>
> > This is normally used for motherboard lightning, right? I believe this
> > is getting common on gaming boards, and we want common support for
> > that.
>
> I agree.

These boards are indeed far from being a rarity so having a function
for them (maybe named LED_FUNCTION_RGB_HEADER?) makes sense IMHO. I'll
submit a patch for that with the next revision.

Speaking of which, after looking at the multicolor patchset it is
pretty obvious that it would be a much better way to expose this RGB
header, so I think I will wait until it is merged and adapt the driver
to use it.

Thanks for the feedback!
Alex.
