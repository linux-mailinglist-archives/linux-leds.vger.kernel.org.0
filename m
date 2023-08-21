Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAA7D782756
	for <lists+linux-leds@lfdr.de>; Mon, 21 Aug 2023 12:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232758AbjHUKqT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 21 Aug 2023 06:46:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234857AbjHUKqS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 21 Aug 2023 06:46:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD230E1
        for <linux-leds@vger.kernel.org>; Mon, 21 Aug 2023 03:46:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4A4866306D
        for <linux-leds@vger.kernel.org>; Mon, 21 Aug 2023 10:46:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC2D9C433CC;
        Mon, 21 Aug 2023 10:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692614775;
        bh=65wh16l+ICzU8nHCRWK8MMfP6V+OTIGsyMZhuVYGVuI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Oi+KrBI36kZkq3WH5E8DLjWMjC8Q+6/iDWypFCocDpFQT0k0C/KkaeKqjT07pHvKa
         xwVkDJRKWwLqF+5rLOWqT/5pYDXU9Us/4cMB/PYAh3iLy1Kdt5qFoWJCGOmerSmSud
         OZWiQiRYlY89bqPM7NVc/AEAbY6r7KYf/7pUU3V93GnLDQ2f/nily84OfjxY633PIZ
         MIr2JNiaHUzOHK7yLYLw0ML1ZXufnJe4kXIpj6PRH3X+lTxF58w8Pv07XRtRR210Kb
         kTiWBXtXA7cblB8TDeBqwsEtvctv1d6ZZly2cUQimhQzFhPxNYndgJqIywPwsvyTXQ
         WGfgiMKkrYUBw==
Date:   Mon, 21 Aug 2023 12:46:11 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Lee Jones <lee@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 6/6] leds: turris-omnia: add support for
 enabling/disabling HW gamma correction
Message-ID: <20230821124611.56bc70c3@dellmb>
In-Reply-To: <20230818103003.GS986605@google.com>
References: <20230802160748.11208-1-kabel@kernel.org>
        <20230802160748.11208-7-kabel@kernel.org>
        <20230818103003.GS986605@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 18 Aug 2023 11:30:03 +0100
Lee Jones <lee@kernel.org> wrote:

> > -static int omnia_cmd_read(const struct i2c_client *client, u8 cmd)
> > +static int omnia_cmd_read_raw(struct i2c_adapter *adapter, u8 addr, u8 cmd,
> > +			      void *reply, size_t len)
> >  {
> >  	struct i2c_msg msgs[2];
> > -	u8 reply;
> >  	int ret;
> >  
> > -	msgs[0].addr = client->addr;
> > +	msgs[0].addr = addr;
> >  	msgs[0].flags = 0;
> >  	msgs[0].len = 1;
> >  	msgs[0].buf = &cmd;
> > -	msgs[1].addr = client->addr;
> > +	msgs[1].addr = addr;
> >  	msgs[1].flags = I2C_M_RD;
> > -	msgs[1].len = 1;
> > -	msgs[1].buf = &reply;
> > +	msgs[1].len = len;
> > +	msgs[1].buf = reply;
> >  
> > -	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> > +	ret = i2c_transfer(adapter, msgs, ARRAY_SIZE(msgs));
> >  	if (likely(ret == ARRAY_SIZE(msgs)))
> > -		return reply;
> > +		return 0;  
> 
> Why not return ret and use that throughout?
> 
> >  	else if (ret < 0)
> >  		return ret;
> >  	else
> >  		return -EIO;
> >  }  
> 

As I explained to your similar question in your reply to patch 2/6

  https://lore.kernel.org/linux-leds/20230821120136.130cc916@dellmb/T/#me5782c9896bc3d994cb36e8b5485d6368cd92da0

the reason I normalize to zero is because of the intended semantics of
these functions: return 0 on success, -errno on error.

If instead in omnia_cmd_read() and omnia_cmd_write() I simply return
the return value of the underlying functions, which are
  i2c_transfer()    for omnia_cmd_read()
  i2c_master_send() for omnia_cmd_write()
the semantics would be inconsistent, because:
  i2c_transfer() returns the number of successful I2C transfers,
  i2c_manster_send() returns the number of written bytes over I2C.

Nonetheless, if you insist on this change, I will do it. Reluctantly
and with a silent protest, but I will not argue further, since I want
this functionality in upstream more than to argue over nitpicks :-)

Marek
