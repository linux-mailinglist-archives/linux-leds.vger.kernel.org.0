Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B10831FA26
	for <lists+linux-leds@lfdr.de>; Fri, 19 Feb 2021 14:57:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbhBSN5V (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Feb 2021 08:57:21 -0500
Received: from mga11.intel.com ([192.55.52.93]:52104 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229636AbhBSN5U (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 19 Feb 2021 08:57:20 -0500
IronPort-SDR: U0L9glj0LbjFDdYTjqkrTB81FrhDgNV6Y6RR2xPGjlklLhxYJOJB0nD0ZmSgu7VR/rEJGAzSNy
 +4fKCju/bupg==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="180331905"
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; 
   d="scan'208";a="180331905"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2021 05:55:34 -0800
IronPort-SDR: mQlPCQFL5QGufihX8XucWzipo9ErMQ6qnRGrAuoIqyVY3rOgxVUqz30tDQJiYU6X5PWtBHZczS
 snFMella6euA==
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; 
   d="scan'208";a="496299341"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2021 05:55:33 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lD6Fn-006E2l-07; Fri, 19 Feb 2021 15:55:31 +0200
Date:   Fri, 19 Feb 2021 15:55:30 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sven Schuchmann <schuchmann@schleissheimer.de>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] leds: lp50xx: add setting of default intensity
 from DT
Message-ID: <YC/DUmhXate4NhML@smile.fi.intel.com>
References: <20210204143738.28036-1-schuchmann@schleissheimer.de>
 <20210204145308.GC14305@duo.ucw.cz>
 <DB8P190MB0634587826F57667BB3BBB6CD9B29@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
 <20210205103438.GB27854@amd>
 <DB8P190MB063473FEA37E69E6DF6BC5F6D9B29@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
 <20210219111659.GI19207@duo.ucw.cz>
 <DB8P190MB06340AA6D789A80A4CE2B6C6D9849@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DB8P190MB06340AA6D789A80A4CE2B6C6D9849@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Feb 19, 2021 at 11:38:09AM +0000, Sven Schuchmann wrote:
> Hello Pavel, hello Andy,
> 
> > -----Ursprüngliche Nachricht-----
> > Von: Pavel Machek <pavel@ucw.cz>
> > Gesendet: Freitag, 19. Februar 2021 12:17
> > An: Sven Schuchmann <schuchmann@schleissheimer.de>
> > Cc: Dan Murphy <dmurphy@ti.com>; linux-leds@vger.kernel.org; linux-kernel@vger.kernel.org
> > Betreff: Re: [PATCH v2 2/4] leds: lp50xx: add setting of default intensity from DT
> > 
> > > > Can you or Dan submit patch getting the regulator support to work? If
> > > > not, I guess we should remove the regulator support after all.
> > >
> > > To be true I am fairly new to the kernel and have no idea
> > > how to test this. So no, I don't want provide a patch (except
> > > for removing), sorry.
> > 
> > No problem. It seems Andy submitted series for this.
> > 
> 
> To me it seems that patches from Andy don't make
> the regulator work. Maybe I am wrong?

I;m not sure I understand this correctly. Do you mean that my patches broke
something? Which one explicitly and what is broken?

> I am very busy right now but hopefully I will find some more
> time next week to submit some new patches. On my list so far
> for the lp50xx:
> * Remove unused variable https://www.spinics.net/lists/linux-leds/msg17654.html
> * Enable-GPIO not working (used before init, reset/enable order wrong)
> * Add default setting from DT https://www.spinics.net/lists/linux-leds/msg17596.html
> * Fix regulator https://www.spinics.net/lists/linux-leds/msg17631.html

-- 
With Best Regards,
Andy Shevchenko


