Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7E77828F5
	for <lists+linux-leds@lfdr.de>; Mon, 21 Aug 2023 14:26:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234856AbjHUM0w (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 21 Aug 2023 08:26:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230526AbjHUM0v (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 21 Aug 2023 08:26:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 545A1C2
        for <linux-leds@vger.kernel.org>; Mon, 21 Aug 2023 05:26:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DFE7861302
        for <linux-leds@vger.kernel.org>; Mon, 21 Aug 2023 12:26:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D65C433C8;
        Mon, 21 Aug 2023 12:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692620809;
        bh=3h6B6eS4mrdNlY07ZPkCYXquV2Hc5RS9w3onhOdqKlI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bHfgOlRC3WUQ77EugwlfE+OPSAevJTQMa9V2XtoDQRMttJpZGILV1TxsfC1y5yP7w
         1e/k48jrNpZTl2+cT3iUis3EMa8f6TfLe1u2kh7No/fJ1ftKAbJfJ9c8J6kQsyhY66
         XZQSsg66+Mykm2m7fmG9RZaY9p0rEYv2EU2cKhd8mAR6h7jtZlHNP8GzHrtL+LdgYK
         J/8bYjxcAbFKDMGlnKHhAXtJP4F4JGlX2DXnKuq3siCrNQRF9Br+aam5i4YRzzb59N
         3urQtPJDlDLzjNCbEFlviYrArEz5QWFtNxsG5/1+e/Q95Zw98kbU1LKTOfIVOcjz5t
         P6IZkpLrojONA==
Date:   Mon, 21 Aug 2023 13:26:44 +0100
From:   Lee Jones <lee@kernel.org>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 6/6] leds: turris-omnia: add support for
 enabling/disabling HW gamma correction
Message-ID: <20230821122644.GJ1380343@google.com>
References: <20230802160748.11208-1-kabel@kernel.org>
 <20230802160748.11208-7-kabel@kernel.org>
 <20230818103003.GS986605@google.com>
 <20230821124611.56bc70c3@dellmb>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230821124611.56bc70c3@dellmb>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 21 Aug 2023, Marek Behún wrote:

> On Fri, 18 Aug 2023 11:30:03 +0100
> Lee Jones <lee@kernel.org> wrote:
> 
> > > -static int omnia_cmd_read(const struct i2c_client *client, u8 cmd)
> > > +static int omnia_cmd_read_raw(struct i2c_adapter *adapter, u8 addr, u8 cmd,
> > > +			      void *reply, size_t len)
> > >  {
> > >  	struct i2c_msg msgs[2];
> > > -	u8 reply;
> > >  	int ret;
> > >  
> > > -	msgs[0].addr = client->addr;
> > > +	msgs[0].addr = addr;
> > >  	msgs[0].flags = 0;
> > >  	msgs[0].len = 1;
> > >  	msgs[0].buf = &cmd;
> > > -	msgs[1].addr = client->addr;
> > > +	msgs[1].addr = addr;
> > >  	msgs[1].flags = I2C_M_RD;
> > > -	msgs[1].len = 1;
> > > -	msgs[1].buf = &reply;
> > > +	msgs[1].len = len;
> > > +	msgs[1].buf = reply;
> > >  
> > > -	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> > > +	ret = i2c_transfer(adapter, msgs, ARRAY_SIZE(msgs));
> > >  	if (likely(ret == ARRAY_SIZE(msgs)))
> > > -		return reply;
> > > +		return 0;  
> > 
> > Why not return ret and use that throughout?
> > 
> > >  	else if (ret < 0)
> > >  		return ret;
> > >  	else
> > >  		return -EIO;
> > >  }  
> > 
> 
> As I explained to your similar question in your reply to patch 2/6
> 
>   https://lore.kernel.org/linux-leds/20230821120136.130cc916@dellmb/T/#me5782c9896bc3d994cb36e8b5485d6368cd92da0
> 
> the reason I normalize to zero is because of the intended semantics of
> these functions: return 0 on success, -errno on error.
> 
> If instead in omnia_cmd_read() and omnia_cmd_write() I simply return
> the return value of the underlying functions, which are
>   i2c_transfer()    for omnia_cmd_read()
>   i2c_master_send() for omnia_cmd_write()
> the semantics would be inconsistent, because:
>   i2c_transfer() returns the number of successful I2C transfers,
>   i2c_manster_send() returns the number of written bytes over I2C.
> 
> Nonetheless, if you insist on this change, I will do it. Reluctantly
> and with a silent protest, but I will not argue further, since I want
> this functionality in upstream more than to argue over nitpicks :-)

API semantics is not nitpicking.  Besides, we have time to talk.  We are
too late in the cycle for this to get merge this side of the merge
window anyway.

Read and write APIs, even abstracted ones such as these generally return
the number of bytes successfully read and written respectively.  If you
are going to normalise, then please do so against this standard.

-- 
Lee Jones [李琼斯]
