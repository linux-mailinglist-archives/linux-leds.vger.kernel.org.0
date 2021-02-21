Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 566E13209A0
	for <lists+linux-leds@lfdr.de>; Sun, 21 Feb 2021 11:44:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbhBUKnt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 21 Feb 2021 05:43:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53494 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229634AbhBUKnt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Sun, 21 Feb 2021 05:43:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613904142;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=95WzN+w1wOtGeC2x3JHydOUXIdt35Y5bPfjanlsuwt8=;
        b=B6T0bViz7ESh/jg89Iio+2UA39FTHeYgrPDAgZoEGeDQsv1O/GpRoUXBXhCo0kRhloXNgY
        2zmJmcOQtB7t4w7/2ICVqtbrK5odx4VpJg3WJ24YmR1xvJgGHoQu8HGYMBseuPnMjzbTL/
        RQSaNV3KBdgLeOGBu3m1rbm5n2JPHu0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-nGz02jeXNqm8Umw2W_K9FA-1; Sun, 21 Feb 2021 05:42:19 -0500
X-MC-Unique: nGz02jeXNqm8Umw2W_K9FA-1
Received: by mail-ed1-f69.google.com with SMTP id y90so5433970ede.8
        for <linux-leds@vger.kernel.org>; Sun, 21 Feb 2021 02:42:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=95WzN+w1wOtGeC2x3JHydOUXIdt35Y5bPfjanlsuwt8=;
        b=U/p89sHTdDNXCkF6Dam6B+n1wZbqgj4dnMtAxwz7yt6GWFNu5tsnH323sA2QILgNHx
         EMKaa1FsWhIvvlAI1ZjNx712idlQHrlsYbk7ZzkoJ/rhKLFttt2/qfu8pn3v3UqxOtOS
         /t8urr+biY43Tay7fCWoYjoRvw4TmyZzrxBz39ZERkc+u3puRS9+7scTqCLJff6jdJOb
         tY7BtWb9T9jGGPCTKeK1gJ677nl+kCQQuKvh93PVQQT24TZnC2+NeeJ+i+mPvxedpzgW
         uvwNNN7iWNJPMQyx8xPcNXRUNxSlgzTKeyp5GZfdxAPASHFUbE880CmnpQlqXpX7XAKu
         eoFQ==
X-Gm-Message-State: AOAM533P9wZ48SwDUi6Avj3/BcYEcnTAGVugWv2vEZGYEJTb0r81PGdF
        AO8w0no87OO7pkQ9Ta7nKSw5oNeFIGARz9a8CaR/p0TDaUdt1zHR0MSqCOsUhdeOzkHf4oP3CUZ
        2j9zEtEyFCghl/V4uU7UYeUrcEFG/t9BqIWsKpC5pOxF0ZnitLJy+hcew5cvVCCKLD8KS5t1GoA
        ==
X-Received: by 2002:a17:906:d18e:: with SMTP id c14mr16684980ejz.302.1613904138258;
        Sun, 21 Feb 2021 02:42:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztQaUYeLRDrLxWVB6mB2uhWsKVsau6fVcwvouUgdMBOHJjM8btQv8uRfssBeYC1iUxCIlTQQ==
X-Received: by 2002:a17:906:d18e:: with SMTP id c14mr16684965ejz.302.1613904138063;
        Sun, 21 Feb 2021 02:42:18 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id u18sm8121961ejc.76.2021.02.21.02.42.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Feb 2021 02:42:17 -0800 (PST)
Subject: Re: [PATCH v2 6/7] HID: lenovo: Map mic-mute button to KEY_F20
 instead of KEY_MICMUTE
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org
References: <20210220122438.21857-1-hdegoede@redhat.com>
 <20210220122438.21857-7-hdegoede@redhat.com> <20210221024225.4310028d@nic.cz>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <5bda52b5-0f6e-8bce-e53c-108081da87ee@redhat.com>
Date:   Sun, 21 Feb 2021 11:42:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210221024225.4310028d@nic.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 2/21/21 2:42 AM, Marek Behun wrote:
> On Sat, 20 Feb 2021 13:24:37 +0100
> Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> Mapping the mic-mute button to KEY_MICMUTE is technically correct but
>> KEY_MICMUTE translates to a scancode of 256 (248 + 8) under X,
>> which does not fit in 8 bits, so it does not work.
> 
> Why does it need to fit 8 bits? Where is the problem?

As the commit message says, "under X" aka X11 / Xorg. This is a well known
limitation of the X11 input stack / of XKB *as implemented in X11*
the Wayland input stack does not have this limitations and does allow
using raw key-codes >= 248.

If you look at e.g. :
https://github.com/systemd/systemd/blob/main/hwdb.d/60-keyboard.hwdb

Which (mostly) maps custom PS/2 scancodes used for some "media" keys
on laptops to linux evdev KEY_FOO codes, then you will see that there
are no lines there which end with "=micmute" instead there are quite
a few lines like this:

 KEYBOARD_KEY_8a=f20                                    # Microphone mute button; should be micmute

Arguably it would be more correct to have the kernel still send
KEY_MICMUTE and do the remapping to KEY_F20 in userspace in e.g. hwdb.

But that will not work here, the remapping is done based on mapping
the HID usage-code to a new evdev KEY_FOO code, basically overriding
lenovo_input_mapping_tp10_ultrabook_kbd() mapping.

But the "Lenovo ThinkPad 10 Ultrabook Keyboard" uses the same 0x000c0001
usage code for all of its custom Fn+F# media keys, so instead of doing
the mapping purely on usage-code it is done on a combination of usage-code +
the index of the key in the input-report (since the usage-code is not unique
for a single key):

        /*
         * The ThinkPad 10 Ultrabook Keyboard uses 0x000c0001 usage for
         * a bunch of keys which have no standard consumer page code.
         */
        if (usage->hid == 0x000c0001) {
                switch (usage->usage_index) {
                case 8: /* Fn-Esc: Fn-lock toggle */
                        map_key_clear(KEY_FN_ESC);
                        return 1;
                case 9: /* Fn-F4: Mic mute */
                        map_key_clear(LENOVO_KEY_MICMUTE);
                        return 1;
		...


So in this case we cannot fixup the mapping from userspace, as userspace
remapping is purely done based on the "scancode" which in case of HID devices
is the HID usage-code.

I don't even know what will happen if we were to try. I guess that either the
first key with a matching usage-code is remapped, or all of them are remapped,
both of which are wrong.

Regards,

Hans

