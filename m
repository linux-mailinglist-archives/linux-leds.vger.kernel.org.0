Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55210D8F57
	for <lists+linux-leds@lfdr.de>; Wed, 16 Oct 2019 13:25:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403933AbfJPLZD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 16 Oct 2019 07:25:03 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45052 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403855AbfJPLZC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 16 Oct 2019 07:25:02 -0400
Received: by mail-lj1-f195.google.com with SMTP id m13so23557659ljj.11
        for <linux-leds@vger.kernel.org>; Wed, 16 Oct 2019 04:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MlGfNW+ZwLIIrjx2RXVhFO36vcxe4kSh91BJi93HZos=;
        b=Q52LV5dhAqKzb9M3AlTjL0SI4SrXZTZ7kHbwa/KvZkyNXw1KEUisSwTAXlpIvFyRdI
         KZiKfo3O1ks0VJDd0N/wkc7Ll6JDLeWwNr/0QBlFH5gqq1+RctHDwfwinZW4e9pdndBr
         BbRGJjbRM9bgDlYtQfeDJzqVnb/xQoZ9P5ZfIiS3zawD51hz1HWegt5fsZGcN4zndXxN
         TRROJuvs14Ed8UkRTfUI1SYUbVaCBK3jvcp18AsgekZjEdBtMs1SiWdsyKL0h6z8/1Iv
         05ehbl7PL7whK0ZfPc2Hj6+RqoIxmtSpm3wX0mwz1+MbwOhFBunRogMaJ+BMaoEGmC4r
         ijzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MlGfNW+ZwLIIrjx2RXVhFO36vcxe4kSh91BJi93HZos=;
        b=dP0oz6RuRIeLHfsU6VHCNFVMlfSrz3CvdvQWDd6/+f7TCc4D+7hcI9IRBBFjYCQ42e
         Z4h3Joe79rLEY80r1FY4EnqhyzFlvo6kX6wZq3tvYeTz76iaZvgNQd0S7YBYd1flZsxB
         ByOP8Vi15aKp63vQ6kqPnEOM61mUAqVnU+iNTTA5eBq/JU+c6Bou2HHbSfCDosQjuwSC
         zldR2krbxN6u+ui5I+pv/N5rpg3zqFfWOGN9e7vSWFqHOV6K1X/uRDxUlTWt5iT9Kb6r
         fETZT9ImP7W/URuupEAWMwpcL5V771dWXFmfY/OgL4HLWjJqYyj/X4FWVUHI7VfPPhv3
         ygYw==
X-Gm-Message-State: APjAAAU0Mzmc1bEElxJQvoJ+e9/cWHj+Akj0Vb0Y8im2KMk6BwH7NQDG
        Gdb3M1/ztgpQG4JgXSgIzd6T4+UA0hI+Ro7yzmor4Q==
X-Google-Smtp-Source: APXvYqxHJCsCiOB07sfl//pV88Ji6ehsYnvrh50L4VAxJJIWuK8+6oBcB8+7Hgh2P49tJS+pXeAJM7bhEsUVTSP1i4o=
X-Received: by 2002:a2e:81cf:: with SMTP id s15mr5591377ljg.99.1571225100228;
 Wed, 16 Oct 2019 04:25:00 -0700 (PDT)
MIME-Version: 1.0
References: <20191008204800.19870-1-dmurphy@ti.com> <20191008204800.19870-12-dmurphy@ti.com>
In-Reply-To: <20191008204800.19870-12-dmurphy@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 16 Oct 2019 13:24:48 +0200
Message-ID: <CACRpkdZnJttsw-mpV3cZY51nE6reHqhuwiCH48_k49b=A9NGQg@mail.gmail.com>
Subject: Re: [PATCH v11 11/16] ARM: dts: ste-href: Add reg property to the
 LP5521 channel nodes
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Oct 8, 2019 at 10:48 PM Dan Murphy <dmurphy@ti.com> wrote:

> Add the reg property to each channel node.  This update is
> to accomodate the multicolor framework.  In addition to the
> accomodation this allows the LEDs to be placed on any channel
> and allow designs to skip channels as opposed to requiring
> sequential order.
>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> CC: Linus Walleij <linus.walleij@linaro.org>

Patch applied to the Ux500 tree.

Yours,
Linus Walleij
