Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A01F02C3FBA
	for <lists+linux-leds@lfdr.de>; Wed, 25 Nov 2020 13:18:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728792AbgKYMRB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Nov 2020 07:17:01 -0500
Received: from mga18.intel.com ([134.134.136.126]:6412 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727626AbgKYMRB (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 25 Nov 2020 07:17:01 -0500
IronPort-SDR: ocSDS+G1wxfbf+yl52PTXPXubbuEmkA4dhT3rHhwz6w8whSZSdGhtCviyo/FZZ5jITM90oAY6t
 bo8407441Wgg==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="159888983"
X-IronPort-AV: E=Sophos;i="5.78,368,1599548400"; 
   d="scan'208";a="159888983"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2020 04:17:00 -0800
IronPort-SDR: Xm8ijyUR1Zfd8mPqv7w3FUG+/mbI67hYd6Tl4m/i+IgfTv+RkyotzZO8ykcx92Ba8AJiZ6WZ74
 WOSnUcmQRYPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,368,1599548400"; 
   d="scan'208";a="432939088"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 25 Nov 2020 04:16:57 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 25 Nov 2020 14:16:57 +0200
Date:   Wed, 25 Nov 2020 14:16:57 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        dmurphy@ti.com, jacek.anaszewski@gmail.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] leds: lp50xx: Fix an error handling path in
 'lp50xx_probe_dt()'
Message-ID: <20201125121657.GH1008337@kuha.fi.intel.com>
References: <20200922210515.385099-1-christophe.jaillet@wanadoo.fr>
 <20200923133510.GJ4282@kadam>
 <faa49efc-5ba5-b6bd-b486-2f7c4611219b@wanadoo.fr>
 <20200924064932.GP18329@kadam>
 <20200928115301.GB3987353@kuha.fi.intel.com>
 <20201125104629.GE25562@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201125104629.GE25562@amd>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Nov 25, 2020 at 11:46:29AM +0100, Pavel Machek wrote:
> Hi!
> 
> > > > > I have been trying to teach Smatch to understand reference counting so
> > > > > it can discover these kinds of bugs automatically.
> > > > > 
> > > > > I don't know how software_node_get_next_child() can work when it doesn't
> > > > > call kobject_get().  This sort of bug would have been caught in testing
> > > > > because it affects the success path so I must be reading the code wrong.
> > > > > 
> > > > 
> > > > I had the same reading of the code and thought that I was missing something
> > > > somewhere.
> > > > 
> > > > There is the same question about 'acpi_get_next_subnode' which is also a
> > > > '.get_next_child_node' function, without any ref counting, if I'm correct.
> > > > 
> > > 
> > > Yeah, but there aren't any ->get/put() ops for the acpi_get_next_subnode()
> > > stuff so it's not a problem.  (Presumably there is some other sort of
> > > refcounting policy there).
> > 
> > OK, so I guess we need to make software_node_get_next_child()
> > mimic the behaviour of of_get_next_available_child(), and not
> > acpi_get_next_subnode(). Does the attached patch work?
> 
> Does not sound unreasonable. Did it get solved, somehow?

Has anybody tested my patch?

thanks,

-- 
heikki
