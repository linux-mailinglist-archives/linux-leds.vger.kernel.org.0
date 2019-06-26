Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD3656CF1
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2019 16:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728244AbfFZO4d (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Jun 2019 10:56:33 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:42498 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbfFZO4c (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Jun 2019 10:56:32 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id C13EB807C0; Wed, 26 Jun 2019 16:56:19 +0200 (CEST)
Date:   Wed, 26 Jun 2019 16:56:24 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Brian Dodge <bdodge09@gmail.com>, lee.jones@linaro.org,
        jingoohan1@gmail.com, jacek.anaszewski@gmail.com,
        robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        pbacon@psemi.com
Subject: Re: [PATCH 1/2] dt-bindings: backlight: fix vendor prefix for
 ArcticSand arcxcnn driver bindings
Message-ID: <20190626145624.GC22348@xo-6d-61-c0.localdomain>
References: <1561435529-7835-1-git-send-email-bdodge09@gmail.com>
 <1561435529-7835-2-git-send-email-bdodge09@gmail.com>
 <20190625085534.xf2ullyju3ewbgik@holly.lan>
 <CAFaGBPnH=75=wJRM4EX9MYR8MSehEa2_hBEOsqo-DZvD6c6f_A@mail.gmail.com>
 <20190626105614.ujmryi7qou2ra7aq@holly.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190626105614.ujmryi7qou2ra7aq@holly.lan>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed 2019-06-26 11:56:14, Daniel Thompson wrote:
> On Tue, Jun 25, 2019 at 07:44:06AM -0400, Brian Dodge wrote:
> > I would like to deprecate the old prefix in the future after communicating
> > with all chip customers, which is why the old prefix is not documented in
> > the new bindings.
> 
> Deprecation is fine (by me at least) it's just that I'm not sure that
> removing the documentation for the deprecated bindings is the right way
> to do it. What is the prior art here?

I believe we should keep the docs.

								Pavel
