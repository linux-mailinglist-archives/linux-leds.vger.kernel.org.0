Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8892C11765
	for <lists+linux-leds@lfdr.de>; Thu,  2 May 2019 12:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbfEBKml (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 2 May 2019 06:42:41 -0400
Received: from onstation.org ([52.200.56.107]:36154 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726242AbfEBKml (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 2 May 2019 06:42:41 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 301433E87D;
        Thu,  2 May 2019 10:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1556793760;
        bh=K7Cjww+vVyauxok0wNSyRl6X27bdPZhoR2t4aaeUtFg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gwemzpUmSI4+iFJdNxQg3pyjOTHNRBRpJhAlncFwY3ayBp3GC3/QwUqpRWrpZb96J
         IWcs+C0KmsxbBrVg+JloYyBigrtfKgO41vsl7cskSvCg5L4TPmE+t+PSts2jiXEAb1
         WN59mnMTceerjAjqJ4GO0FSs0ZrvXTiVDnWjiin0=
Date:   Thu, 2 May 2019 06:42:39 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     lee.jones@linaro.org, jingoohan1@gmail.com, robh+dt@kernel.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, mark.rutland@arm.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dmurphy@ti.com, jonathan@marek.ca,
        Daniel Thompson <daniel@redfelineninja.org.uk>
Subject: Re: [PATCH v6 1/3] backlight: lm3630a: return 0 on success in
 update_status functions
Message-ID: <20190502104239.GA24563@basecamp>
References: <20190424092505.6578-1-masneyb@onstation.org>
 <20190424092505.6578-2-masneyb@onstation.org>
 <864c1ddc-1008-0041-1559-e491ca0186ef@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <864c1ddc-1008-0041-1559-e491ca0186ef@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, May 02, 2019 at 11:07:51AM +0100, Daniel Thompson wrote:
> On 24/04/2019 10:25, Brian Masney wrote:
> > lm3630a_bank_a_update_status() and lm3630a_bank_b_update_status()
> > both return the brightness value if the brightness was successfully
> > updated. Writing to these attributes via sysfs would cause a 'Bad
> > address' error to be returned. These functions should return 0 on
> > success, so let's change it to correct that error.
> > 
> > Signed-off-by: Brian Masney <masneyb@onstation.org>
> > Fixes: 28e64a68a2ef ("backlight: lm3630: apply chip revision")
> > Acked-by: Pavel Machek <pavel@ucw.cz>
> 
> Hi Brian, sorry for the delay. For some reason your mails are being dumped
> before they reach me so I only discovered these patches when I paid proper
> attention to the replies and fetched them from patchwork.
> 
> Hi Lee, is the same thing happening for you? ;-)

Huh, that's odd. I haven't ran into that issue when working with people
from Linaro in other subsystems.

As a sanity check, I used 'git send-email' to send this patch to
check-auth@verifier.port25.com and it verified that I still have SPF,
DKIM, reverse DNS, etc. all setup properly on this domain.

hotmail.com addresses are the only ones I've had issues with in the
past, but I doubt you're forwarding your email there. :)

Brian
