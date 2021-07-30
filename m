Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFEE83DB2BC
	for <lists+linux-leds@lfdr.de>; Fri, 30 Jul 2021 07:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233201AbhG3FWY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 30 Jul 2021 01:22:24 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:50165 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229696AbhG3FWY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 30 Jul 2021 01:22:24 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id B013F580D65;
        Fri, 30 Jul 2021 01:22:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 30 Jul 2021 01:22:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=w
        Z3kutLqmcKQSNip3ycj7XGCG1ZWDjerJRvqk0QSHZU=; b=BuomH8qzwT4tALiDl
        1vvTx8AQRdRK03K/c44WkmzqAzSSvSd2BKdtL6br6Uxgsce9a3efQVVa7Bik4ioc
        oooOTbE7QoDEwwxuXrIiHWwjjWzvhiAKmmxBNusBDpkl0JYoWhF6XCmVPAfXeJy/
        Y/H1Qa9Qot+qKa8nJmlGd0O7QTGH0hEqI+Bd+IN6Ysu42Na/oXfUvEtzwtpQzCuZ
        ltfhuqSMhYnFUsdPC/aHelqqlkS18ZvGUTZEHBUu8T4tqdz4ZzwgxZKqL4ag0PsP
        lH4q7TNa/r/TyzM6R5Tvj5p5NTIylU2wil7BHXfiRPQ5jcXnUQEEvYS314rEQdOz
        qZtBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=wZ3kutLqmcKQSNip3ycj7XGCG1ZWDjerJRvqk0QSH
        ZU=; b=W/RL+RnDcbQqBAdaQn7yFZp1OdzFohjyvjMHp7rfQaNi4mJEUZkbMdwq3
        VCn/rfRv6KUyBeRjfPiR5/bAF6IdWpKtIIqtJLV+o0+C7F5LLNFlxppXAMXSf5eh
        rhpHfRVxGhfgifxyR449pC+7dUg5GuB+xzahqrqlEIEE2HoHPhsext5B7THDA/6/
        QWyOuJypQTeCd3YoHB5A3TFyreECeP8qJPpNvtRXwhmCPDSoEKkHMwE9tvivBtz1
        PXYx5X490xQz/mYQotbDqeJihUxRQw4RUBPaXYbUxdQWexi2O6FZRM5qVXYp/BKa
        xV599mJPVnGkFI1Oh+HZw33hQsVAQ==
X-ME-Sender: <xms:iowDYTizcg78LosaRTdbPH_r_nimNDxKdJvMXea-pJVfsHM9b73y2Q>
    <xme:iowDYQC7cENA8p7TmbRzq3QV82nAhAWcBQ6M4Gg2K7G34VFIFTqLI3y7daroud-Sa
    dvjFzLqARuPtw>
X-ME-Received: <xmr:iowDYTH3YVqjyJkDgQHw6j7AcgjnWwS8X1tZd1DSTiBs_luJmG_ghVMSp2V4Z5ZjCvCSvPv-qUNiNs-U2cGH_eNG38SEOLyQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrheeggdejhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeeuheekhe
    elffefieduteefkeejffdvueehjeejffehledugfetkedvleekudduvdenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:iowDYQSy2yNQuwG09wEV9uTJzXcaOjCkWWBr7gHA_p8zkO8B1p5Gvg>
    <xmx:iowDYQwobnYPKK7xHHGvU4BYN3WeT6hgKVCgQPW6wxLuYN6-7uGraQ>
    <xmx:iowDYW5x2Dj1PryFqgcicVL68rc2Ubl1ShWBX6r5bnAQZyYqL-kgdg>
    <xmx:i4wDYVI04zKJLztJry6rR3d5MF_sa7wiQksfJENiH2Wh2yCOAfHaDg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Jul 2021 01:22:18 -0400 (EDT)
Date:   Fri, 30 Jul 2021 07:22:16 +0200
From:   Greg KH <greg@kroah.com>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
        axboe@kernel.dk, kernelnewbies@kernelnewbies.org,
        linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
        pavel@ucw.cz, linux-leds@vger.kernel.org
Subject: Re: [RFC PATCH 1/8] docs: Add block device LED trigger documentation
Message-ID: <YQOMiO1HAf60Odqa@kroah.com>
References: <20210729015344.3366750-1-arequipeno@gmail.com>
 <20210729015344.3366750-2-arequipeno@gmail.com>
 <108629.1627528155@turing-police>
 <ee56510e-e8ef-5e92-3e29-4e290bfad9b2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ee56510e-e8ef-5e92-3e29-4e290bfad9b2@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Jul 29, 2021 at 10:52:06AM -0500, Ian Pilcher wrote:
> On 7/28/21 10:09 PM, Valdis Klētnieks wrote:
> > > +	# cat /sys/class/block/led_trigger_list
> > > +	baz: 0
> > > +	bar: 0
> > > +	foo: 0
> > 
> > This looks like an abuse of the "one entry one value" rule for sysfs.
> > Perhaps this should be a directory /sys/class/block/defined_triggers/
> > and separate files under that for foo, bar, and baz?  That would probably
> > make reference counting a lot easier as well....
> 
> Indeed it is.
> 
> Funny that you should mention using a subdirectory.  I originally wanted
> to put all of the trigger-related stuff into
> /sys/class/block/led_triggers/, but I couldn't find any API to create a
> subdirectory for *class* attributes (only for device attributes), nor do
> I see any such subdirectories on my system.

Add a name to your attribute group and sysfs creates the subdirectory
automagically for you.

thanks,

greg k-h
