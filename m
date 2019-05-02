Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5D611178D
	for <lists+linux-leds@lfdr.de>; Thu,  2 May 2019 12:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbfEBKqs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 2 May 2019 06:46:48 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35994 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726266AbfEBKqs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 2 May 2019 06:46:48 -0400
Received: by mail-wm1-f68.google.com with SMTP id p16so1982800wma.1
        for <linux-leds@vger.kernel.org>; Thu, 02 May 2019 03:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=upr4s3UIqgMfOrxzX8hhRFt6bzy1u9Hfi57/Qn9/txc=;
        b=ONa1Kh3MkmzE3M+vKHgiL4PwCW7ge1VCjQn6DkjkKRFwkrOiHF5j2fYLMdPH4Rztwh
         frXJi5Ac0BfSXIcwW2euSoiS1uDBKY0IJpY7Jyd3aX5ErqYvHEWT3Eu3eFzN3hSy+fWJ
         xELWO3+47dApN8Evpzl5hFryTd4WopsbAivnKmbX8r7oiEXlaO6rVfvEsn81LBtm5WE4
         l38NRQQUPmeOTieKupNNQ0ztW+qbYYsO+0PZ3v2w1nP5hqpfkzqLWBVzAS7D7iKsx2fe
         h4gicOY03ITDlRaXt2umQf4RCP3fAPxpJZEBUxcaisPKIAho8tEnpPa2GfyFTvT7p4wx
         miew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=upr4s3UIqgMfOrxzX8hhRFt6bzy1u9Hfi57/Qn9/txc=;
        b=eLAMO11MjQwzlHjh/qs0Ui9Dn4MTqN+zg+SaB9g/Llm4+JApCC6Y25TtWpITM0MQb3
         aWKkHSB5esQlEXzKwVnERfv0LRJC+Dz/Ee11LOB0V+cgaUypc86zIYICBpORYF7XFDFL
         QBAd+Go/yuz4mCu17wS/FmATzheG78jt+xZKu2C1zvtmiZUBiS0ddZCuP0S/4+7F58n7
         F0Vup/JHhMUQD5oj6x8ac8mszsmQETcOIGBG53vSUGFCuHRNAf5P1ko13jR+XM/1FPXo
         WyN3zY+bfo4T/AsNfB4BuqZOVXLJ4rDPozBjRuMoMpSHCE4nTy10iqgKTkf1X8D/+F8L
         B6Zg==
X-Gm-Message-State: APjAAAXOeFr94RqvCVYcJi1Rl5ILp6++Euh6TYB3WD59qj8yWPPAkWTj
        nQBNTgfPgsHg8nSdijHmDmedAQ==
X-Google-Smtp-Source: APXvYqz8ljUpeAkWeR0JjC3hksspS6xNuZxWwhyiG3PhQ+JauGvsPlF8u6dmrVg+yH7KYtohRo/pYg==
X-Received: by 2002:a1c:e708:: with SMTP id e8mr1866607wmh.73.1556794006806;
        Thu, 02 May 2019 03:46:46 -0700 (PDT)
Received: from holly.lan (static-84-9-17-116.vodafonexdsl.co.uk. [84.9.17.116])
        by smtp.gmail.com with ESMTPSA id z16sm23205477wrt.26.2019.05.02.03.46.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 May 2019 03:46:46 -0700 (PDT)
Date:   Thu, 2 May 2019 11:46:44 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     lee.jones@linaro.org, jingoohan1@gmail.com, robh+dt@kernel.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, mark.rutland@arm.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dmurphy@ti.com, jonathan@marek.ca,
        Daniel Thompson <daniel@redfelineninja.org.uk>
Subject: Re: [PATCH v6 1/3] backlight: lm3630a: return 0 on success in
 update_status functions
Message-ID: <20190502104644.e3eth2cdebuz2mpk@holly.lan>
References: <20190424092505.6578-1-masneyb@onstation.org>
 <20190424092505.6578-2-masneyb@onstation.org>
 <864c1ddc-1008-0041-1559-e491ca0186ef@linaro.org>
 <20190502104239.GA24563@basecamp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190502104239.GA24563@basecamp>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, May 02, 2019 at 06:42:39AM -0400, Brian Masney wrote:
> On Thu, May 02, 2019 at 11:07:51AM +0100, Daniel Thompson wrote:
> > On 24/04/2019 10:25, Brian Masney wrote:
> > > lm3630a_bank_a_update_status() and lm3630a_bank_b_update_status()
> > > both return the brightness value if the brightness was successfully
> > > updated. Writing to these attributes via sysfs would cause a 'Bad
> > > address' error to be returned. These functions should return 0 on
> > > success, so let's change it to correct that error.
> > > 
> > > Signed-off-by: Brian Masney <masneyb@onstation.org>
> > > Fixes: 28e64a68a2ef ("backlight: lm3630: apply chip revision")
> > > Acked-by: Pavel Machek <pavel@ucw.cz>
> > 
> > Hi Brian, sorry for the delay. For some reason your mails are being dumped
> > before they reach me so I only discovered these patches when I paid proper
> > attention to the replies and fetched them from patchwork.
> > 
> > Hi Lee, is the same thing happening for you? ;-)
> 
> Huh, that's odd. I haven't ran into that issue when working with people
> from Linaro in other subsystems.
> 
> As a sanity check, I used 'git send-email' to send this patch to
> check-auth@verifier.port25.com and it verified that I still have SPF,
> DKIM, reverse DNS, etc. all setup properly on this domain.
> 
> hotmail.com addresses are the only ones I've had issues with in the
> past, but I doubt you're forwarding your email there. :)

No... and strangely enough your recent e-mail sailed through just fine.
Let's wait and see what is happening for Lee (which I suspect may not be
until well into next week).


Daniel.
