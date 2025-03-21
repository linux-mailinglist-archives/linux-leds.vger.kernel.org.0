Return-Path: <linux-leds+bounces-4332-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 137DBA6B5EE
	for <lists+linux-leds@lfdr.de>; Fri, 21 Mar 2025 09:17:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 724DC4616FE
	for <lists+linux-leds@lfdr.de>; Fri, 21 Mar 2025 08:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF16E79EA;
	Fri, 21 Mar 2025 08:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jRParab+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0cJe17yE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jRParab+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0cJe17yE"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5F01EFF94
	for <linux-leds@vger.kernel.org>; Fri, 21 Mar 2025 08:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742544983; cv=none; b=d+PIa5QVUGF+geEdha+5oIXTOJOj/AHu60OwVo2TCk6+o7rNsdg1iobaBbCTrMgXhm7aFP9rR778vSDBIorG9+eikbSnpHeBCC6g1+Ey4k3zTHgoyr36jAvzhvlbde3gAXZ51xTDvq7bh1SX9UI2XBiAys3n1CWCgi64mocmzlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742544983; c=relaxed/simple;
	bh=BGgrnTpO3g8DXyxUbe9l2Bc38Yqm/Ep1f3RvxCSZC80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YEPNBeV2U5WoXtZF6T5HY3NsfT1UkxS1MqrZ9jXifMsCzq1bOymkUvS4POwFWStsLCnhsQuBllUEx45VjqUg7cHsmyEBExCR72HZ/e2JhtjT8dJAuBpFosEoEVH4JCo1elWdOKX2KyN1m1s3tQGLOHIhEsR0jsZEt4MawDlJegE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jRParab+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0cJe17yE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jRParab+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0cJe17yE; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 11D001F894;
	Fri, 21 Mar 2025 08:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742544979; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=OKsfgMuHErOU5DWDWuizqL9rmprZzY2Eg8bxeCWY2as=;
	b=jRParab+DlgWXxP4YmSeueG1ZiCp4/QEIqh2A+QNLGSbsVCNnsHSgs0bUW21wDQFsj5a0S
	EYLayseKGIyeAYeveOnzpUIkcM31fk5Rmf5etUnOyKqRG205xOY2zTXzVfRqxuqTk0m/1J
	ADOD1u0mW2cVH4hI2XoDvYJ5G9jDnFg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742544979;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=OKsfgMuHErOU5DWDWuizqL9rmprZzY2Eg8bxeCWY2as=;
	b=0cJe17yEPkrsA69t7F6CyzmSjVSAzUlbi4c4zGs5B0hFmTacZPAzrlpw0bAvJsJQzvBJSy
	kqL+1yHt0ZwhUtDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742544979; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=OKsfgMuHErOU5DWDWuizqL9rmprZzY2Eg8bxeCWY2as=;
	b=jRParab+DlgWXxP4YmSeueG1ZiCp4/QEIqh2A+QNLGSbsVCNnsHSgs0bUW21wDQFsj5a0S
	EYLayseKGIyeAYeveOnzpUIkcM31fk5Rmf5etUnOyKqRG205xOY2zTXzVfRqxuqTk0m/1J
	ADOD1u0mW2cVH4hI2XoDvYJ5G9jDnFg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742544979;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=OKsfgMuHErOU5DWDWuizqL9rmprZzY2Eg8bxeCWY2as=;
	b=0cJe17yEPkrsA69t7F6CyzmSjVSAzUlbi4c4zGs5B0hFmTacZPAzrlpw0bAvJsJQzvBJSy
	kqL+1yHt0ZwhUtDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C714C13A2C;
	Fri, 21 Mar 2025 08:16:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GW/hLlIg3WfjAQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 21 Mar 2025 08:16:18 +0000
Message-ID: <25453126-43ba-4d60-8c6c-1216532af073@suse.de>
Date: Fri, 21 Mar 2025 09:16:18 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/11] backlight: lcd: Replace fb events with a
 dedicated function call
To: Daniel Thompson <danielt@kernel.org>
Cc: lee@kernel.org, pavel@ucw.cz, jingoohan1@gmail.com, deller@gmx.de,
 simona@ffwll.ch, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20250306140947.580324-1-tzimmermann@suse.de>
 <20250306140947.580324-9-tzimmermann@suse.de> <Z9k_qy-Kh3-v5tKg@aspen.lan>
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
In-Reply-To: <Z9k_qy-Kh3-v5tKg@aspen.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,ucw.cz,gmail.com,gmx.de,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
X-Spam-Flag: NO

Hi

Am 18.03.25 um 10:40 schrieb Daniel Thompson:
> On Thu, Mar 06, 2025 at 03:05:50PM +0100, Thomas Zimmermann wrote:
>> Remove support for fb events from the lcd subsystem. Provide the
>> helper lcd_notify_blank_all() instead. In fbdev, call
>> lcd_notify_blank_all() to inform the lcd subsystem of changes
>> to a display's blank state.
>>
>> Fbdev maintains a list of all installed notifiers. Instead of fbdev
>> notifiers, maintain an internal list of lcd devices.
> I don't love the LCD devices list, however I can see the list of notifiers
> had the same semantic effect (only less explicit) so I can live with
> it ;-).
>
>> v3:
>> - export lcd_notify_mode_change_all() (kernel test robot)
>> v2:
>> - maintain global list of lcd devices
>> - avoid IS_REACHABLE() in source file
>> - use lock guards
>> - initialize lcd list and list mutex
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Happy with these changes, but have the same EXPORT_SYMBOL_GPL()
> questions I did with the backlight code.

As in backlight.c, all existing symbols are exported with 
EXPORT_SYMBOL(). I simply used what was already there.

Best regards
Thomas

>
>
> Daniel.
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


