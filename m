Return-Path: <linux-leds+bounces-3967-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF442A34276
	for <lists+linux-leds@lfdr.de>; Thu, 13 Feb 2025 15:37:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1BC83AAA56
	for <lists+linux-leds@lfdr.de>; Thu, 13 Feb 2025 14:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 272D328137F;
	Thu, 13 Feb 2025 14:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kf37dWQB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0ItvqN1D";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kf37dWQB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0ItvqN1D"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7436281360;
	Thu, 13 Feb 2025 14:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739457289; cv=none; b=fWcP0vMuvVOukw9r486X3EV6iVjX+vwYMnLiwpJrD3QjIrn5Qpv9Ty3HRhfKDGGayH97syLh9w+njzbK7s6FvZ8JywUzE6SMyBURokO+Eh0Ot+Wju+DziKHG52HNz0ReQmxqZBtB5wSUbeJLpHNs4xjyNQszg9p2O/aNUgKwYCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739457289; c=relaxed/simple;
	bh=esejIqUew7LN491naaGVcl3KM5wSpEQwMFsnRuM3QPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sNpOw5bUAtOfHHP9Pn8MPcyALMOjCXRBW00lwjKkNjJocYHI957IYNIZ10XbnPMkMVTd82V1j2e0Ucgp5dLVMOYVPym3x/zCpwhU7RV6qMb0TWh6MV0cAiC9henbCSysQE01847iB+dytm2XgOs6BxMEPX0hyaLmUK7tQb4oGxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kf37dWQB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0ItvqN1D; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kf37dWQB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0ItvqN1D; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C1C4922722;
	Thu, 13 Feb 2025 14:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739457281; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wp8TjRodEc+mcUY+IrJYHHLbmhYAasAk58YBjFvPRcI=;
	b=kf37dWQBXMRcRVObCN5glN8TpYfF4O6sOMYFl/kPTjycQjsjuXPP0cEkSte0ib+TBIJw7S
	H/UkKwoISB5dxASfLHIirsX18ctE1q6TnOOwxYyVszYdGcVApF2TfxNZbK200ssdEK3nmO
	aCMZYaqy5HR6TcLx6FynB/7qPIv6BN4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739457281;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wp8TjRodEc+mcUY+IrJYHHLbmhYAasAk58YBjFvPRcI=;
	b=0ItvqN1DtS6V2rGfKasa5i25wB/plIFCgx2fS9L/Lu7qgtoZ0iORzVDS4w6PI0MYNQhBXv
	eKXvh/A3dcbizhBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kf37dWQB;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=0ItvqN1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739457281; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wp8TjRodEc+mcUY+IrJYHHLbmhYAasAk58YBjFvPRcI=;
	b=kf37dWQBXMRcRVObCN5glN8TpYfF4O6sOMYFl/kPTjycQjsjuXPP0cEkSte0ib+TBIJw7S
	H/UkKwoISB5dxASfLHIirsX18ctE1q6TnOOwxYyVszYdGcVApF2TfxNZbK200ssdEK3nmO
	aCMZYaqy5HR6TcLx6FynB/7qPIv6BN4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739457281;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wp8TjRodEc+mcUY+IrJYHHLbmhYAasAk58YBjFvPRcI=;
	b=0ItvqN1DtS6V2rGfKasa5i25wB/plIFCgx2fS9L/Lu7qgtoZ0iORzVDS4w6PI0MYNQhBXv
	eKXvh/A3dcbizhBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 86144137DB;
	Thu, 13 Feb 2025 14:34:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QBRwHwEDrmcCagAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 13 Feb 2025 14:34:41 +0000
Message-ID: <f4652dbd-7544-4a6d-98d0-f4b64d60a435@suse.de>
Date: Thu, 13 Feb 2025 15:34:41 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] leds: backlight trigger: Replace fb events with a
 dedicated function call
To: Lee Jones <lee@kernel.org>
Cc: pavel@ucw.cz, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 simona@ffwll.ch, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20250206154033.697495-1-tzimmermann@suse.de>
 <20250206154033.697495-13-tzimmermann@suse.de>
 <20250211135752.GT1868108@google.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20250211135752.GT1868108@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: C1C4922722
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[ucw.cz,kernel.org,gmail.com,gmx.de,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

Hi

Am 11.02.25 um 14:57 schrieb Lee Jones:
> On Thu, 06 Feb 2025, Thomas Zimmermann wrote:
>
>> Remove support for fb events from the led backlight trigger. Provide the
>> helper ledtrig_backlight_blank() instead. Call it from fbdev to inform
>> the trigger of changes to a display's blank state.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/leds/trigger/ledtrig-backlight.c | 31 +++++-------------------
>>   drivers/video/fbdev/core/fbmem.c         | 21 +++++++++-------
>>   include/linux/leds.h                     |  6 +++++
>>   3 files changed, 24 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/leds/trigger/ledtrig-backlight.c b/drivers/leds/trigger/ledtrig-backlight.c
>> index f9317f93483b..e3ae4adc29e3 100644
>> --- a/drivers/leds/trigger/ledtrig-backlight.c
>> +++ b/drivers/leds/trigger/ledtrig-backlight.c
>> @@ -10,7 +10,6 @@
>>   #include <linux/kernel.h>
>>   #include <linux/slab.h>
>>   #include <linux/init.h>
>> -#include <linux/fb.h>
>>   #include <linux/leds.h>
>>   #include "../leds.h"
>>   
>> @@ -21,7 +20,6 @@ struct bl_trig_notifier {
>>   	struct led_classdev *led;
>>   	int brightness;
>>   	int old_status;
>> -	struct notifier_block notifier;
>>   	unsigned invert;
>>   
>>   	struct list_head entry;
>> @@ -30,7 +28,7 @@ struct bl_trig_notifier {
>>   static struct list_head ledtrig_backlight_list;
>>   static struct mutex ledtrig_backlight_list_mutex;
>>   
>> -static void ledtrig_backlight_blank(struct bl_trig_notifier *n, bool on)
>> +static void __ledtrig_backlight_blank(struct bl_trig_notifier *n, bool on)
> I'm confused.  Didn't you just introduce this?

It's being renamed here; probably something to avoid.


>
>>   {
>>   	struct led_classdev *led = n->led;
>>   	int new_status = !on ? BLANK : UNBLANK;
>> @@ -48,23 +46,14 @@ static void ledtrig_backlight_blank(struct bl_trig_notifier *n, bool on)
>>   	n->old_status = new_status;
>>   }
>>   
>> -static int fb_notifier_callback(struct notifier_block *p,
>> -				unsigned long event, void *data)
>> +void ledtrig_backlight_blank(bool on)
>>   {
>> -	struct bl_trig_notifier *n = container_of(p,
>> -					struct bl_trig_notifier, notifier);
>> -	struct fb_event *fb_event = data;
>> -	int *blank;
>> -
>> -	/* If we aren't interested in this event, skip it immediately ... */
>> -	if (event != FB_EVENT_BLANK)
>> -		return 0;
>> -
>> -	blank = fb_event->data;
>> +	struct bl_trig_notifier *n;
>>   
>> -	ledtrig_backlight_blank(n, !blank[0]);
>> +	guard(mutex)(&ledtrig_backlight_list_mutex);
>>   
>> -	return 0;
>> +	list_for_each_entry(n, &ledtrig_backlight_list, entry)
>> +		__ledtrig_backlight_blank(n, on);
>>   }
>>   
>>   static ssize_t bl_trig_invert_show(struct device *dev,
>> @@ -110,8 +99,6 @@ ATTRIBUTE_GROUPS(bl_trig);
>>   
>>   static int bl_trig_activate(struct led_classdev *led)
>>   {
>> -	int ret;
>> -
>>   	struct bl_trig_notifier *n;
>>   
>>   	n = kzalloc(sizeof(struct bl_trig_notifier), GFP_KERNEL);
>> @@ -122,11 +109,6 @@ static int bl_trig_activate(struct led_classdev *led)
>>   	n->led = led;
>>   	n->brightness = led->brightness;
>>   	n->old_status = UNBLANK;
>> -	n->notifier.notifier_call = fb_notifier_callback;
>> -
>> -	ret = fb_register_client(&n->notifier);
>> -	if (ret)
>> -		dev_err(led->dev, "unable to register backlight trigger\n");
>>   
>>   	mutex_lock(&ledtrig_backlight_list_mutex);
>>   	list_add(&n->entry, &ledtrig_backlight_list);
>> @@ -143,7 +125,6 @@ static void bl_trig_deactivate(struct led_classdev *led)
>>   	list_del(&n->entry);
>>   	mutex_unlock(&ledtrig_backlight_list_mutex);
>>   
>> -	fb_unregister_client(&n->notifier);
>>   	kfree(n);
>>   }
>>   
>> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
>> index fb7ca143a996..92c3fe2a7aff 100644
>> --- a/drivers/video/fbdev/core/fbmem.c
>> +++ b/drivers/video/fbdev/core/fbmem.c
>> @@ -16,6 +16,7 @@
>>   #include <linux/fb.h>
>>   #include <linux/fbcon.h>
>>   #include <linux/lcd.h>
>> +#include <linux/leds.h>
>>   
>>   #include <video/nomodeset.h>
>>   
>> @@ -373,11 +374,19 @@ static void fb_lcd_notify_blank(struct fb_info *info)
>>   #endif
>>   }
>>   
>> +static void fb_ledtrig_backlight_notify_blank(struct fb_info *info)
>> +{
>> +#if IS_REACHABLE(CONFIG_LEDS_TRIGGER_BACKLIGHT)
> #iferry is generally discouraged in C files.
>
> Does is_defined() work for you?

I don't think so. This ifdef covers the case that fbdev is built in, but 
led is a module (i.e., fbdev=y && led=m).

> /
>> +	if (info->blank == FB_BLANK_UNBLANK)
>> +		ledtrig_backlight_blank(true);
> If !CONFIG_LEDS_TRIGGER_BACKLIGHT(), then ledtrig_backlight_blank() is a
> noop anyway, right?  So why encompass it in the #if at all?

Because of (fbdev=y && led=m) again. ledtrig_backlight_blank() would be 
defined then, but not linkable from fbdev. Preferably, I'd rather leave 
out the ifdef in the led header file.

Best regards
Thomas

>
>> +	else
>> +		ledtrig_backlight_blank(false);
>> +#endif
>> +}
>> +
>>   int fb_blank(struct fb_info *info, int blank)
>>   {
>>   	int old_blank = info->blank;
>> -	struct fb_event event;
>> -	int data[2];
>>   	int ret;
>>   
>>   	if (!info->fbops->fb_blank)
>> @@ -386,11 +395,6 @@ int fb_blank(struct fb_info *info, int blank)
>>   	if (blank > FB_BLANK_POWERDOWN)
>>   		blank = FB_BLANK_POWERDOWN;
>>   
>> -	data[0] = blank;
>> -	data[1] = old_blank;
>> -	event.info = info;
>> -	event.data = data;
>> -
>>   	info->blank = blank;
>>   
>>   	ret = info->fbops->fb_blank(blank, info);
>> @@ -399,8 +403,7 @@ int fb_blank(struct fb_info *info, int blank)
>>   
>>   	fb_bl_notify_blank(info, old_blank);
>>   	fb_lcd_notify_blank(info);
>> -
>> -	fb_notifier_call_chain(FB_EVENT_BLANK, &event);
>> +	fb_ledtrig_backlight_notify_blank(info);
>>   
>>   	return 0;
>>   
>> diff --git a/include/linux/leds.h b/include/linux/leds.h
>> index 98f9719c924c..8c7c41888f7d 100644
>> --- a/include/linux/leds.h
>> +++ b/include/linux/leds.h
>> @@ -640,6 +640,12 @@ static inline void ledtrig_flash_ctrl(bool on) {}
>>   static inline void ledtrig_torch_ctrl(bool on) {}
>>   #endif
>>   
>> +#if IS_ENABLED(CONFIG_LEDS_TRIGGER_BACKLIGHT)
>> +void ledtrig_backlight_blank(bool on);
>> +#else
>> +static inline void ledtrig_backlight_blank(bool on) {}
>> +#endif
>> +
>>   /*
>>    * Generic LED platform data for describing LED names and default triggers.
>>    */
>> -- 
>> 2.48.1
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


