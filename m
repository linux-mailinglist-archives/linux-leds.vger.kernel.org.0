Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13A361182B0
	for <lists+linux-leds@lfdr.de>; Tue, 10 Dec 2019 09:46:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726884AbfLJIqv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Dec 2019 03:46:51 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38631 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726847AbfLJIqv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 10 Dec 2019 03:46:51 -0500
Received: by mail-wm1-f68.google.com with SMTP id p17so2130272wmi.3
        for <linux-leds@vger.kernel.org>; Tue, 10 Dec 2019 00:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=YH5R0EOR7oNUMNAq0Ry62wkEQeH2/oUkN8cpbZjAY7U=;
        b=DeFbGSCwhfLZgxdoHwevEaC6pGOR/3mjtvSyGOpQQYKWZeff2YN3Iv9VdGB/USU5yw
         ljleAVDxqdrWzBvvCDbNUtN4XbZQwTqLFJi12kzacj8sXrVTf0ajf5N4sHNT8yypyjj3
         l8uqMz1zh3XER6+sNyxvoIURhzQ/l5mJIdfsWr7r4xR5KEvsI4Teq0Y0u5FUTa2tV/gy
         W926Nj4SOs+Qfo5ewHfd1rtzcegIoczd/B3TU2d60TE8dsAkbwGoQEru10ebbC4a0GQQ
         pPlArT9q0wF9gvBDB/QpRT9GtE9hNI292REsaLF7A/iSqvQkZ5Hgs6dOBJet+7gaG1Te
         5cWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=YH5R0EOR7oNUMNAq0Ry62wkEQeH2/oUkN8cpbZjAY7U=;
        b=udVOTwXPSfHU1logazIv1cWyuCxsI7DuRVGXAlTvcD50va/ISANSFMmJWKitQcrZ8b
         0B3C8SUb/PVpiYTBVSgnrNMxPbUEXNTqJWRws5zxW8nJ/kZS0hbkYQIpOmhKSR9UWP3C
         AEQFN1j01QCHzO7/1myO3Veo9aL2vj3sxZU9H+kW8YdBy90GglpzEORr/gtAqDvezEWg
         CCuRnRwJxxWB4g8De3qxfC5ATUSGx5JIqq6nlqGiAPlOCToQ6/fl5EgDnxtH+3YcQGmt
         JTBQOuQs5y9Ca2GKvgVmUFiP0qaO04A+21MLMovEgeIP+7wqHoHUeqqhJ5odbXklXBlo
         SSyA==
X-Gm-Message-State: APjAAAWlnfpMn0Oo0DUHqVmVkrHI/9slbBu7Lo+L+aSS3sHbcoPBmnes
        qlyClYqCELrGTBfJKp7UVzGzJA==
X-Google-Smtp-Source: APXvYqy+Kg461LSDPA7TU+oMQnfgn8vGSzGZT39l0xIjpnrmDlYCqziDZRyjYbFhZnvZtvy1S9Qm7A==
X-Received: by 2002:a05:600c:219a:: with SMTP id e26mr4045527wme.42.1575967609112;
        Tue, 10 Dec 2019 00:46:49 -0800 (PST)
Received: from dell (h185-20-99-176.host.redstation.co.uk. [185.20.99.176])
        by smtp.gmail.com with ESMTPSA id b185sm2372512wme.36.2019.12.10.00.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 00:46:48 -0800 (PST)
Date:   Tue, 10 Dec 2019 08:46:43 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Sven Van Asbroeck <thesven73@gmail.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Grigoryev Denis <grigoryev@fastwel.ru>,
        Axel Lin <axel.lin@ingics.com>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v4 2/2] dt-bindings: mfd: update TI tps6105x chip bindings
Message-ID: <20191210084643.GP3468@dell>
References: <20191121142726.22856-1-TheSven73@gmail.com>
 <20191121142726.22856-3-TheSven73@gmail.com>
 <20191209123206.GI3468@dell>
 <CAGngYiX4hgEM7cjeLE-sRswDXTff92OqdBWNgx5WGNmPjuqsUA@mail.gmail.com>
 <20191210084603.GO3468@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191210084603.GO3468@dell>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 10 Dec 2019, Lee Jones wrote:

> On Mon, 09 Dec 2019, Sven Van Asbroeck wrote:
> 
> > Hi Lee, thank you for the review.
> > 
> > On Mon, Dec 9, 2019 at 7:32 AM Lee Jones <lee.jones@linaro.org> wrote:
> > >
> > > > Tree: next-20191118
> > >
> > > Why is this in your commit message?
> > 
> > I have been posting patches against various maintainer trees lately, which
> > will not apply to mainline or next. So I have been including base tree
> > information in the patch itself.
> > 
> > Base-tree info on patches is high on developers' wish list, but not yet
> > standardized. This was discussed at the 2019 kernel maintainers
> > summit:
> > https://lwn.net/Articles/803619/
> 
> NB: I haven't seen this discussion (or opened this link just yet).
> 
> It's no problem to have it in the submission, but it would be better
> to have it *below* the '--' with the diff, such that if it is applied,
> it doesn't end up in the kernel's Git history.

Obviously that was meant to be '---'.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
