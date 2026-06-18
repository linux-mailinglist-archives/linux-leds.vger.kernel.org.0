Return-Path: <linux-leds+bounces-8660-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TfHKG+rjM2rOHgYAu9opvQ
	(envelope-from <linux-leds+bounces-8660-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 14:26:18 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7F66A002F
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 14:26:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=e4eHq5Ei;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8660-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8660-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 645B83007A7C
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 12:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 374D73F4834;
	Thu, 18 Jun 2026 12:26:12 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B623B2FE9;
	Thu, 18 Jun 2026 12:26:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781785572; cv=none; b=cY9IFHPIIPVhhxqi+5VFNJmYz9f0vQobqWTYHq49kdQOTMiECXpX2FUU+u3VW9z1bMkiIS0YN2qkvJjGR+yq3QkMLZKr1cqc9G8/U/OKTXIDgECqPZxv13oSWpPKP3ZlabBwhURx0LsFrs9y+ZfiSNhiCBadQoMSg5cTwddIu4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781785572; c=relaxed/simple;
	bh=117WUoPJJVKNpNS7sQNiPEvrJOc1PB/NlsExRLSSHCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EEYnsZ/b7BjXhFDWL3gGPMBBX+NeatxDl9i+x+CxoeH7dq0URkTTZNiM80tAzzKkLMGxSjkBWR366nlAHmL6czhbRUU3KKgYXmJpb+QuiPSdrc0kRZ8yiSw8QaGbHegyU6jSTborXrqluBc5rdSyZb7hKeMxFhqjYl3kW998N3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e4eHq5Ei; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF59D1F000E9;
	Thu, 18 Jun 2026 12:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781785570;
	bh=KWMmbg3fdKU/LLPkt6+H2CKMwjevnSKk96lM6E2waW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e4eHq5EiuU8HejW20Oe3HCnRjkId5NxXYoj8XPY+/du1tCt99TL8TXgYLIh7+sjgX
	 3oP/gWi2USDEz6rymuzBOCVozwYOCVq/vc7eLecSAPcGKhPKrlO6s6XBICxe7q+4CC
	 9aq2QuOUn2U4P7/xGXtyg1izceuMiUQexAOPoGBNri0AzJdkVHoIXJKPGlPz6v4Uz2
	 3xItMWiqv8dbljRCQuiwWhsx4W7MUJqNQ7WI9sbEmOLm8BbxLqqtA0YFBvz6Db4E0J
	 SRhs8skiHH0jhGWf7t4Y5GrUAmtsXUEpbLkwbniE0A30DjNgX09RdNGvt/TF8XldIH
	 ommrS8TsweflA==
Date: Thu, 18 Jun 2026 13:26:05 +0100
From: Lee Jones <lee@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Ion Agorria <ion@agorria.com>,
	=?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v8 2/7] mfd: Add driver for ASUS Transformer embedded
 controller
Message-ID: <20260618122605.GH1672911@google.com>
References: <20260528053203.9339-1-clamor95@gmail.com>
 <20260528053203.9339-3-clamor95@gmail.com>
 <20260611111732.GN4151951@google.com>
 <CAPVz0n0caBBt6A+AFeUpGdxvb3Qhoui7khLCt3747bPUKmMXhQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n0caBBt6A+AFeUpGdxvb3Qhoui7khLCt3747bPUKmMXhQ@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dmitry.torokhov@gmail.com,m:pavel@kernel.org,m:sre@kernel.org,m:ion@agorria.com,m:mirq-linux@rere.qmqm.pl,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8660-lists,linux-leds=lfdr.de];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,agorria.com,rere.qmqm.pl,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E7F66A002F

On Thu, 11 Jun 2026, Svyatoslav Ryhel wrote:

> чт, 11 черв. 2026 р. о 14:17 Lee Jones <lee@kernel.org> пише:
> >
> > On Thu, 28 May 2026, Svyatoslav Ryhel wrote:
> > > From: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> > >
> > > Support Nuvoton NPCE795-based ECs as used in Asus Transformer TF201,
> > > TF300T, TF300TG, TF300TL and TF700T pad and dock, as well as TF101 dock
> > > and TF600T, P1801-T and TF701T pad. This is a glue driver handling
> > > detection and common operations for EC's functions.
> > >
> > > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> > > ---
> > >  drivers/mfd/Kconfig                     |  16 +
> > >  drivers/mfd/Makefile                    |   1 +
> > >  drivers/mfd/asus-transformer-ec.c       | 542 ++++++++++++++++++++++++
> > >  include/linux/mfd/asus-transformer-ec.h |  92 ++++
> > >  4 files changed, 651 insertions(+)
> > >  create mode 100644 drivers/mfd/asus-transformer-ec.c
> > >  create mode 100644 include/linux/mfd/asus-transformer-ec.h

[...]

> > > +static void asus_ec_clear_buffer(struct asus_ec_data *ddata)
> > > +{
> > > +     int ret, retry = ASUSEC_RSP_BUFFER_SIZE;
> > > +
> > > +     /*
> > > +      * Read the buffer till we get valid data by checking ASUSEC_OBF_MASK
> > > +      * of the status byte or till we reach end of the 256 byte buffer.
> > > +      */
> > > +     while (retry--) {
> > > +             ret = i2c_smbus_read_i2c_block_data(ddata->client, ASUSEC_READ_BUF,
> > > +                                                 ASUSEC_ENTRY_SIZE,
> > > +                                                 ddata->ec_buf);
> > > +             if (ret < ASUSEC_ENTRY_SIZE)
> > > +                     continue;
> > > +
> > > +             if (ddata->ec_buf[ASUSEC_IRQ_STATUS] & ASUSEC_OBF_MASK)
> > > +                     continue;
> > > +
> > > +             break;
> > > +     }
> > > +}
> > > +
> > > +static int asus_ec_log_info(struct asus_ec_data *ddata, unsigned int reg,
> > > +                         const char *name, const char **out)

If we can avoid points to pointers, then please do.

We already have ddata, so we can just set the name?

It will remove a lot of the following complexity / ugliness.

> > > +{
> > > +     struct device *dev = &ddata->client->dev;
> > > +     u8 buf[ASUSEC_ENTRY_BUFSIZE];
> > > +     int ret;
> > > +
> > > +     memset(buf, 0, ASUSEC_ENTRY_BUFSIZE);
> > > +     ret = i2c_smbus_read_i2c_block_data(ddata->ec.dockram, reg,
> > > +                                         ASUSEC_ENTRY_SIZE, buf);
> > > +     if (ret < ASUSEC_ENTRY_SIZE)
> > > +             return ret;
> >
> > Same here.  These should be negative.
> >
> 
> return ret < 0 ? ret : -EIO same as above
> 
> > > +
> > > +     if (buf[0] > ASUSEC_ENTRY_SIZE) {
> > > +             dev_err(dev, "bad data len; buffer: %*ph; ret: %d\n",
> > > +                     ASUSEC_ENTRY_BUFSIZE, buf, ret);
> > > +             return -EPROTO;
> > > +     }
> > > +
> > > +     if (!ddata->logging_disabled) {
> > > +             dev_info(dev, "%-14s: %.*s\n", name, buf[0], buf + 1);
> > > +
> > > +             if (out) {
> > > +                     *out = devm_kasprintf(dev, GFP_KERNEL, "%.*s",
> > > +                                           buf[0], buf + 1);
> > > +                     if (!*out)
> > > +                             return -ENOMEM;
> > > +             }
> > > +     }
> >
> > FWIW, I hate this!  What does it give you now that development is done?
> >
> 
> We have already discussed this, and you agreed that EC and firmware
> prints may stay! This prints EC model and firmware info as well as EC
> firmware behavior. It allows identify possible new revisions of EC -
> Firmware combo and address possible regressions (check if it is chip
> malfunction or firmware needs a new programming model) without
> rebuilding kernel and digging downstream kernel for needed bits of
> code.

Right, so just print it out and remove all of the 'logging_disabled' and
'out' nonsense.

> > > +     return 0;
> > > +}
> > > +
> > > +static int asus_ec_reset(struct asus_ec_data *ddata)
> > > +{
> > > +     int retry, ret;
> > > +
> > > +     guard(mutex)(&ddata->ecreq_lock);
> > > +
> > > +     for (retry = 0; retry < ASUSEC_RETRY_MAX; retry++) {
> >
> > for (int retry = ... is generally preferred for throwaway variables.
> >
> 
> Not that I care too much, but I am defining ret anyway, why not add
> retry too there?

This is the new and preferred way to use throw-away variables.

ret is not a throw-away variable.

[...]

> > > +static int asus_ec_set_factory_mode(struct asus_ec_data *ddata,
> > > +                                 enum asusec_mode fmode)
> > > +{
> > > +     dev_info(&ddata->client->dev, "Entering %s mode.\n",
> > > +              fmode == ASUSEC_MODE_FACTORY ? "factory" : "normal");
> > > +
> > > +     return asus_dockram_access_ctl(ddata->ec.dockram, NULL,
> > > +                                    ASUSEC_CTL_FACTORY_MODE,
> > > +                                    fmode == ASUSEC_MODE_FACTORY ?
> > > +                                    ASUSEC_CTL_FACTORY_MODE : 0);
> >
> > Why not create make:
> >
> > ASUSEC_MODE_FACTORY == ASUSEC_CTL_FACTORY_MODE
> >
> > What happens to NORMAL?
> >
> 
> ASUSEC_CTL_FACTORY_MODE is a bit in the ctl register. For NORMAL mode

I get that, but if the values can be shared, it make the code simpler.

> bit is cleared,
> for FACTORY bit it set, for NONE bit is ignored.
> 
> > > +}
> > > +
> > > +static int asus_ec_detect(struct asus_ec_data *ddata)
> > > +{
> > > +     int ret;
> > > +
> > > +     ret = asus_ec_reset(ddata);
> > > +     if (ret)
> > > +             goto err_exit;
> > > +
> > > +     asus_ec_clear_buffer(ddata);
> > > +
> > > +     ret = asus_ec_log_info(ddata, ASUSEC_DOCKRAM_INFO_MODEL, "Model",
> > > +                            &ddata->ec.model);

Where is this model used?

> > You can use 100-chars and make the code look beautiful! :)
> >
> 
> Not every subsystem permits 100 chars, some stick to 80 as a strict
> rule, so it is better be safe.

Right, but we are forward thinking here.

You can and should use 100-chars in this subsystem.

> > > +     if (ret)
> > > +             goto err_exit;
> > > +
> > > +     ret = asus_ec_log_info(ddata, ASUSEC_DOCKRAM_INFO_FW, "FW version",
> > > +                            NULL);
> > > +     if (ret)
> > > +             goto err_exit;
> > > +
> > > +     ret = asus_ec_log_info(ddata, ASUSEC_DOCKRAM_INFO_CFGFMT, "Config format",
> > > +                            NULL);
> > > +     if (ret)
> > > +             goto err_exit;
> > > +
> > > +     ret = asus_ec_log_info(ddata, ASUSEC_DOCKRAM_INFO_HW, "HW version",
> > > +                            NULL);
> > > +     if (ret)
> > > +             goto err_exit;
> > > +
> > > +     /* Disable logging on next EC request */
> >
> > Why, but why?
> >
> 
> Cause EC requests are frequent (handshake/reset) and constant logging
> same data is not acceptable.

Then rid the prints entirely or do them at a more appropriate point like
during probe?

Or maybe consider dev_info_once() and friends.

> > > +     ddata->logging_disabled = true;
> > > +
> > > +     /* Check and inform about EC firmware behavior */
> > > +     ret = asus_ec_susb_on_status(ddata);
> > > +     if (ret)
> > > +             goto err_exit;
> > > +
> > > +     ddata->ec.name = ddata->info->name;
> > > +
> > > +     /* Some EC require factory mode to be set normal on each request */
> > > +     if (ddata->info->fmode)
> > > +             ret = asus_ec_set_factory_mode(ddata, ddata->info->fmode);
> > > +
> > > +err_exit:
> > > +     if (ret)
> > > +             dev_err(&ddata->client->dev, "failed to access EC: %d\n", ret);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static void asus_ec_handle_smi(struct asus_ec_data *ddata, unsigned int code)
> > > +{
> > > +     switch (code) {
> > > +     case ASUSEC_SMI_HANDSHAKE:
> > > +     case ASUSEC_SMI_RESET:
> > > +             asus_ec_detect(ddata);
> > > +             break;
> > > +     }
> > > +}
> > > +
> > > +static irqreturn_t asus_ec_interrupt(int irq, void *dev_id)
> > > +{
> > > +     struct asus_ec_data *ddata = dev_id;
> > > +     unsigned long notify_action;
> > > +     int ret;
> > > +
> > > +     ret = i2c_smbus_read_i2c_block_data(ddata->client, ASUSEC_READ_BUF,
> > > +                                         ASUSEC_ENTRY_SIZE, ddata->ec_buf);
> > > +     if (ret < ASUSEC_ENTRY_SIZE ||
> > > +         !(ddata->ec_buf[ASUSEC_IRQ_STATUS] & ASUSEC_OBF_MASK))
> >
> > Unwrap for readability.
> >
> > Also, I think a comment would be helpful.
> >
> 
> if (ret < ASUSEC_ENTRY_SIZE)
>     return IRQ_NONE;
> 
> ret = ddata->ec_buf[ASUSEC_IRQ_STATUS] & ASUSEC_OBF_MASK;
> if (!ret)
>     return IRQ_NONE;
> 
> This would be acceptable? (I will add comments later on)

Yes, better.

If you're not using ret again, you could just put 'ddata.." inside the if().

> > > +             return IRQ_NONE;
> > > +
> > > +     notify_action = ddata->ec_buf[ASUSEC_IRQ_STATUS];
> > > +     if (notify_action & ASUSEC_SMI_MASK) {
> > > +             unsigned int code = ddata->ec_buf[ASUSEC_SMI_CODE];
> > > +
> > > +             asus_ec_handle_smi(ddata, code);
> > > +
> > > +             notify_action |= code << 8;
> > > +     }
> > > +
> > > +     blocking_notifier_call_chain(&ddata->ec.notify_list,
> > > +                                  notify_action, ddata->ec_buf);
> > > +
> > > +     return IRQ_HANDLED;
> > > +}
> > > +
> > > +static void asus_ec_release_dockram_dev(void *client)
> > > +{
> > > +     i2c_unregister_device(client);
> > > +}
> > > +
> > > +static struct i2c_client *devm_asus_dockram_get(struct device *dev)
> > > +{
> > > +     struct i2c_client *parent = to_i2c_client(dev);
> > > +     struct i2c_client *dockram;
> > > +     struct dockram_ec_data *ddata;
> > > +     int ret;
> > > +
> > > +     dockram = i2c_new_ancillary_device(parent, "dockram",
> > > +                                        parent->addr + 2);
> >
> > Could we define a macro for the address offset '2' here to avoid using a magic
> > number?
> >
> 
> It seems that you are excessively concerned with "magic numbers".

Bingo!  I HATE magic numbers.

https://lore.kernel.org/all/?q=%22Lee+Jones%22+magic

~900 messages!  =:-D

[...]

> > > +static const struct asus_ec_chip_info asus_ec_tf600t_pad_data = {
> > > +     .name = "pad",
> > > +     .variant = ASUSEC_TF600T_PAD,
> > > +     .fmode = ASUSEC_MODE_NORMAL,
> > > +};
> >
> > Any reason not to just pass the identifier (variant) and add the name
> > and fmode attribues to the switch() above?
> 
> Why not set it here, I am not passing any mfd or any other API via of data.

I get that, and you're not breaking any of my golden rules.

However, I just think doing everything in one place, usually a which
based off of the 'variant' which you pass as a single value, is a nicer,
more consolidated way of doing things.

-- 
Lee Jones

