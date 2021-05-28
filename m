Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 280EB3941D7
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 13:33:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbhE1Lf2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 07:35:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:44374 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230047AbhE1Lf1 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 28 May 2021 07:35:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BB148613D1;
        Fri, 28 May 2021 11:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622201633;
        bh=l0M6J04UfHv6uie7fIhhs5YaSMy3FkfUd96P/oCu1os=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=MxgWKy/5pA7866NOldsAEENFhB6XYYQPjkjJDE2BHTeejLHDsJCPAxRd0rGg3mtMQ
         GGhMzW/4c62C345pg9SU/DYAam9ieqHp4aS7W2iqleD8O64xrt+16EpRylQ5mlAEjk
         cJSdPMQBTnpLSDGbuDcWD1pteUx6eakvgl0BP1VnYQ4jcKXnogf+6DO1xFOu2Wmweb
         b4zZY0hGaVdmX4vKvvX4wElohGtEc26Y+jisqArRRutEAsVHdpHqrU1LygFbnhDRnA
         IIZ6qrL2xtlU5dylrU2YEGLtVmjsqmNRXOhK+7GJYqDPqejczcj4n9907/aFFE1dAx
         KAHxREGWzS7RQ==
Date:   Fri, 28 May 2021 13:33:47 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH v2 16/17] leds: leds-nuc: add support for changing the
 ethernet type indicator
Message-ID: <20210528133347.46634db7@coco.lan>
In-Reply-To: <20210526145112.GB2141@amd>
References: <20210519141102.0161a9d9@thinkpad>
        <20210519162413.4feeab02@coco.lan>
        <20210519175503.567e6ecc@thinkpad>
        <20210519203014.1838de3a@coco.lan>
        <20210520130014.7189a315@dellmb>
        <20210520180028.495f94e4@coco.lan>
        <20210520183633.084a8c3f@thinkpad>
        <20210520205933.3cfc57a9@coco.lan>
        <20210520220703.5a86b994@thinkpad>
        <20210521111400.127ffa10@coco.lan>
        <20210526145112.GB2141@amd>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Em Wed, 26 May 2021 16:51:12 +0200
Pavel Machek <pavel@ucw.cz> escreveu:

> Hi!
> 
> > > You say that for this controller it would be bad to do in SW, because it
> > > would take too much time in BIOS calls. (I wonder how much...)   
> > 
> > Yeah, it would be interesting to know how much. However, measuring BIOS
> > latency and time spent on such calls can be tricky: one needs to use a
> > high-res clock that it is not used anywhere else, in order to measure
> > it.   
> 
> I'm sure you can time kernel compilation while LEDs are using software
> netdev trigger, for example.

I can't see how. I mean, the problem is to monitor the impact of the
BIOS call with may affect not only the application using the LED, but
all other applications running at the same time on different CPUs,
as the BIOS may want/need to lock other CPUs while its code is running, as
it can't see the Linux CPU locks.

Thanks,
Mauro
