Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7566B262299
	for <lists+linux-leds@lfdr.de>; Wed,  9 Sep 2020 00:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729799AbgIHWXh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 8 Sep 2020 18:23:37 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:44514 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728463AbgIHWXg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 8 Sep 2020 18:23:36 -0400
Received: by mail-io1-f66.google.com with SMTP id g128so1047100iof.11;
        Tue, 08 Sep 2020 15:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pt89njDU8e4/fbO7SJk1YbCeJ909hdsNBc8rF5Xpv1M=;
        b=OzD7Upr5Who957KwUclwvweJ6VxCj6d9kQePXhQY7M9w6A1xepPC6ufVWXFl5JfrhC
         HzBSizQ/+/Btxcx/IASZKLVrc4UNIp0FhSxzlkn5mTfHmFujkwN93UkDOCHL2b7twNWb
         lD0Ax5x2/M9ahoCmy1RHH4dQvxyn7iD45WDcjLkybxWt4qn5wLX7SJ/iV8Xd7dRlksgj
         otWW6Wn11UbCfnXTlbWVlevMRrB4wdRLJ1ilZ4bfpZ+6JL58i+CalqWfdqTJ06pzZf4W
         xiLhTNoiHHYA0CJyWVX2iascNAsSkTbpGikl5hF2YLh9rryCYYAsT82lY/TVT5BzwE3S
         zvYA==
X-Gm-Message-State: AOAM532NjfM7NS6n3oSlvFJD4SHbwy/F2n0IVZBM9FmVXSEluGfgVqrT
        Cc+5QgDkseLnu0sV6gtogw==
X-Google-Smtp-Source: ABdhPJxi4fYO/P+mmYN2uZyKydZ32DDpmu+T5BVeero1Ps8B2oa3MBm/hTePXEn+m6yQn65exFoMxA==
X-Received: by 2002:a02:6995:: with SMTP id e143mr1169560jac.78.1599603815597;
        Tue, 08 Sep 2020 15:23:35 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id v14sm331519iol.17.2020.09.08.15.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 15:23:35 -0700 (PDT)
Received: (nullmailer pid 1042217 invoked by uid 1000);
        Tue, 08 Sep 2020 22:23:33 -0000
Date:   Tue, 8 Sep 2020 16:23:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     linux-kernel@vger.kernel.org, monstr@monstr.eu, git@xilinx.com,
        Dan Murphy <dmurphy@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: leds: common: Add missing triggers
Message-ID: <20200908222333.GA1008378@bogus>
References: <f24b081ad7f4695c039cfb9256aae8a522797fcf.1598265564.git.michal.simek@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f24b081ad7f4695c039cfb9256aae8a522797fcf.1598265564.git.michal.simek@xilinx.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Aug 24, 2020 at 12:39:27PM +0200, Michal Simek wrote:
> Xilinx ZynqMP zcu100/ultra96 v1 defines additional triggers which are not
> covered by common.yaml. The patch adds missing triggers for this platform.
> 
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
> 
> There are a lot of other triggers which are missing but the patch focus on
> fixing my platform

The idea was to standardize these and not add a bunch of similar ones. 
Also, there's the 'function' property which is preferred as well as the 
trigger source binding now to better associate LEDs with specific h/w.

Rob
