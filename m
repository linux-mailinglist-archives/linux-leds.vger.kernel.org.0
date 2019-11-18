Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F116100D81
	for <lists+linux-leds@lfdr.de>; Mon, 18 Nov 2019 22:18:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbfKRVSC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 18 Nov 2019 16:18:02 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33228 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbfKRVSC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 18 Nov 2019 16:18:02 -0500
Received: by mail-ot1-f67.google.com with SMTP id u13so15871329ote.0;
        Mon, 18 Nov 2019 13:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IabCX6kBV/Mgb1XtRiYbU3GVuFyLKj7vP/odV1Askuo=;
        b=LUkhNmtywxzw73lNFZSUTSLJvpU4SrC3SSG94jfyYW8wc2YYQFHP2xK3r0UEFQBAO/
         fJg1OejWr58ym84pgfJn4DzUy67tOxF2Msz93xQlzBmFvYCsRuenp/H3jmOpnfl5cm53
         aOEUSSOj1qpW+tmdxq5ZKeZ2dqgltOLm/t829Y2NfhpFka3GgqtSzCB32ha3GBtRJJUI
         moHZr8odRU76Uu3xX1vdLiXuLFzGRNZ33jTCu8QmUbvdz8DEe0f/DrPabGpoRm2JhI7w
         sVEdEL5zNbrveUEU3aPVcTHJiKuca6os1r/uH++1FiiG3fLl+UDBdsQ60FflhJnwRYUo
         +DbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IabCX6kBV/Mgb1XtRiYbU3GVuFyLKj7vP/odV1Askuo=;
        b=rdnpdYFdj1QSmzWVCTDBeMdu2Y0JfxezK+i+3Pg+aK3vyceQn0TLQdrboSp1nWGX0f
         3dcYs4BK+jmxnn0Svat4iY9jx7AKBvLnBmjKcIQvP1Q+TFPk4R+hlbCOMCZlGAQpfAkb
         cusELaZ40UPt48qy3ussgDsXT2TKtkgBah4RSY06pCva1Z0kpiEQQjmUwH/5p+q3V/5y
         Bz07sk1b88r2dORlm4E3Ep1FN/oDmbyeCFKHOPz4ofuD/1fKcVzNObxAUBEXK0ZM2+jg
         YRqhkODyNa7ARkVZHBd/i2tsm2m6vI1b8QKpR5RL9TPKc0XDM2aLB6sl6PojvOhOXKP4
         gL4A==
X-Gm-Message-State: APjAAAXTnNgHFPkH0SQAM06TLQ/ytYdiyppZ0SG4aUdqHsECON5BuV+i
        Ful0mCGtLw+ePSpTUmenLLY9HdF30mAgXIKM0/Q=
X-Google-Smtp-Source: APXvYqy5Csuu3CZ8WGvTufcihjOMe/h9Fe7votgoCqnJbEHErkBVC+bnIWRoLhCs0yChwEz+AMTol5kYrSIIX0OSmYo=
X-Received: by 2002:a9d:6841:: with SMTP id c1mr1053825oto.224.1574111881395;
 Mon, 18 Nov 2019 13:18:01 -0800 (PST)
MIME-Version: 1.0
References: <20191118165400.21985-1-TheSven73@gmail.com> <20191118165400.21985-2-TheSven73@gmail.com>
 <20191118170111.GL9761@sirena.org.uk> <CAGngYiW+8m4fBAY5Ya_4YmEmCTQeiiNP6=aH2mUX6d2wY1442w@mail.gmail.com>
 <20191118174550.GA43585@sirena.org.uk> <CAGngYiXLx8rkkKPyALYyCHFyst2Ft8bCkP4uqmzXAHHqXhUvkQ@mail.gmail.com>
 <20191118203406.GE43585@sirena.org.uk>
In-Reply-To: <20191118203406.GE43585@sirena.org.uk>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Mon, 18 Nov 2019 16:17:49 -0500
Message-ID: <CAGngYiWQixey6t_4evqPdS9Rw+VNf0M1nax8bEqaUt=nLDjEfw@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] tps6105x: add optional devicetree support
To:     Mark Brown <broonie@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Grigoryev Denis <grigoryev@fastwel.ru>,
        Axel Lin <axel.lin@ingics.com>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Nov 18, 2019 at 3:34 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Nov 18, 2019 at 01:13:24PM -0500, Sven Van Asbroeck wrote:
>
> Is the regulator bit of this perhaps a voltage regulator and a current
> regulator packaged together mainly for use powering LEDs?  That's a
> hardware design I've seen before...

Yes, you nailed it :)

>
> Just point the regulator framework at the MFD's DT node - the children
> of the MFD can look at the parent device happily, there's several
> existing MFDs do this.

Ok, I think I get it now. Will prepare v2.
