Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02BF5100A17
	for <lists+linux-leds@lfdr.de>; Mon, 18 Nov 2019 18:18:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbfKRRSF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 18 Nov 2019 12:18:05 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:32859 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbfKRRSE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 18 Nov 2019 12:18:04 -0500
Received: by mail-ot1-f66.google.com with SMTP id u13so15206267ote.0;
        Mon, 18 Nov 2019 09:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5TKxnuBzcjr05lVYmRN35dSMtBRvwosJTK/P0sPY6Yk=;
        b=R5r+mZuqh8K9jrE51jwcdzfjQNBcC3rYnf1d2AaV6qpLgiT1U/Rjf6+ofIPD7+cZEg
         UCKKnY52vPFClB4kR9SDpsSzfW837dnYILaQoSOOm9c2Ql5PXeWvUuwA2R0I/6rNqs4n
         uOxNaaVmFL/5+PPYR08RZ8OzRcgn26E/4aCwVqUz1RveK/S8QLnDMC5TKC3W36lKPR5q
         6SlhLX9P887o20nTBiV+vagVL9a11Ya7rrKUBhiqwvZaG6NYguh7FSJsHZ16sDeXIcLQ
         +Pycill0mxsQRoVIlykY/eN0AHCyTvBv0+Oy7k6NK7Kcfqw9Qkvgu+73O1w+cmYpBy2l
         528Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5TKxnuBzcjr05lVYmRN35dSMtBRvwosJTK/P0sPY6Yk=;
        b=o47eR3yXxo7jQa9gwqOd4DMRa1G0Nh6TfUOZGgFjGL3/0LGSQAXqpZg9gTvv4JlnEP
         AzlCi77+ZxcdgyTfdvwRk4hJWRmsK/WCu+K+MUvrRL7WLGB2703CnYoHTqMnIIRpGIfN
         R94hvQr1d4Z3MO65ATOwQNGmzLV7mBcLTxbhkc0ZdqnJ3QEl4molq0XUxbK48fTqpzh0
         jYim/ace73VcFGtv0jkD+QmPuRZyAXke59aFvnHBuLDXjJHMc3K0lg1sOLx+hldRxizV
         iJ3RwnWH5eiGEWBrWFoZrrkuxxYjvXXoMzfFTNXzk82rpktc1Q59YVjim5R+KfWJgMR/
         x+1g==
X-Gm-Message-State: APjAAAVCbaHtk22XL88lp9LekZRG/Yo+4oiUij/hBCvi5NxX7lHHQWHf
        WEEBZWWRLPljHHIKDakBZ3lhcANWemygK7Ftyk4=
X-Google-Smtp-Source: APXvYqzfUPozG4pcDKDGYdn41lvEZ5ZXLgguJXNCt8xZpovra6yegycavuS1e5SMqSEFC1T5P8wHzW3pezfMggq7fsQ=
X-Received: by 2002:a9d:6841:: with SMTP id c1mr284622oto.224.1574097482161;
 Mon, 18 Nov 2019 09:18:02 -0800 (PST)
MIME-Version: 1.0
References: <20191118165400.21985-1-TheSven73@gmail.com> <20191118165400.21985-2-TheSven73@gmail.com>
 <20191118170111.GL9761@sirena.org.uk>
In-Reply-To: <20191118170111.GL9761@sirena.org.uk>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Mon, 18 Nov 2019 12:17:50 -0500
Message-ID: <CAGngYiW+8m4fBAY5Ya_4YmEmCTQeiiNP6=aH2mUX6d2wY1442w@mail.gmail.com>
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

On Mon, Nov 18, 2019 at 12:01 PM Mark Brown <broonie@kernel.org> wrote:
>
> We shouldn't need a compatible here, the MFD should just instantiate any
> children it has.

If the child node doesn't have a compatible, how would the driver be
able to work
out the operational mode? The chip can only be in a single operational mode
at a time. So the child node has 'led' or 'regulator' compatible.

Or is there a more elegant method I've overlooked?

> This also doesn't document any actual regulators on
> the device.

The chip contains a single optional regulator only. I documented its
dt bindings later in the patchset.
