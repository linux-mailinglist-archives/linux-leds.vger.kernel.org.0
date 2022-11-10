Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 367DC624365
	for <lists+linux-leds@lfdr.de>; Thu, 10 Nov 2022 14:40:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230445AbiKJNkV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 10 Nov 2022 08:40:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbiKJNkU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 10 Nov 2022 08:40:20 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1127831342
        for <linux-leds@vger.kernel.org>; Thu, 10 Nov 2022 05:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668087563;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=aByhD+u7e5ysEhGwu8joJIq9fuZ918iDvc+dlsbuQzI=;
        b=Em38wTuFC+HFBu6tbO096tDM8dsUNG8yLctrGa3Wkk6P0s7z0dbatRpeps2Gsh2kY6Y3HQ
        ELpZsJbAX8k/H+FiZMnooaPQ/y38A0V4DQnEY3mLCxl+qq8sY63JiBYGRPTbaiH1L6GI2X
        0kr+eIoxDnAMk++mtO6Y4OERqeqtdFw=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-563-HxF8H_VXMLy1Q2xUoeRKDg-1; Thu, 10 Nov 2022 08:39:22 -0500
X-MC-Unique: HxF8H_VXMLy1Q2xUoeRKDg-1
Received: by mail-lf1-f71.google.com with SMTP id w2-20020ac24422000000b004a299d12364so558510lfl.13
        for <linux-leds@vger.kernel.org>; Thu, 10 Nov 2022 05:39:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aByhD+u7e5ysEhGwu8joJIq9fuZ918iDvc+dlsbuQzI=;
        b=UPprMPzkX4V3WjbY+3YWHRs/dEIwHkRQjX5VPN0ar/PDDLmyqDltdxtJ4urIWAzV+M
         mJ51cYNAr99tOhNsW2Itl+2sncjfH5Z3LU8VqcF2ZXNu1N24LWaGm7XOjxv16PfHfvde
         XTP2gPzrOWoQBgw3A5CcUHUVisb8hZbWJR9DmIm9UodYz1Xwm9qJ2Or7cFE0+bS2/RVA
         F49tZzL+Q62ntpaQrgYOpUfRfMO0vTR6fa2RMMC4PRFPCe+mJgkOlfLGjLxEeH9u5PAw
         OmcymMM7fNObikC03Bus/vbtVq2D4gfXf+dbwNmHK3xBi+xskFuCXACS/cRnHZN2ay4N
         e4NQ==
X-Gm-Message-State: ACrzQf0ntkQ8Bse2qT2jqPY+Ag5Q/jifz5fXQFRbmqqO+ONt5L4NWXDO
        iZCeUmD+J3BlWZcgbJTvC0H1eTWnSTYHwNIy3xcYfEQyidfSJxvSbgtch59p9rhiimH/3aqfLrY
        I/IIAjhGKe3seM8xiU7IH8hhm+yktklUT1N3Q+Q==
X-Received: by 2002:a19:430c:0:b0:4a9:e27a:1cfa with SMTP id q12-20020a19430c000000b004a9e27a1cfamr1384827lfa.147.1668087560537;
        Thu, 10 Nov 2022 05:39:20 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5FC1Lj4JEW/VC+s1AS66k2fT2JcDAvUzNE7OVcS/2LY94i+gEjzbK0TImWm8Km08AgxmjPomWFTbR6r4qSu7Y=
X-Received: by 2002:a19:430c:0:b0:4a9:e27a:1cfa with SMTP id
 q12-20020a19430c000000b004a9e27a1cfamr1384819lfa.147.1668087560288; Thu, 10
 Nov 2022 05:39:20 -0800 (PST)
MIME-Version: 1.0
References: <Y1AVDck5sQf8+QFX@rowland.harvard.edu> <CABfF9mPU52OXTGcsbatJCG4nbP4zaPN3iJnttMg+xRyGY6dUEQ@mail.gmail.com>
 <CAO-hwJJ7cF-4kd8Mi6bb5n-k5LuMrWbpdMqFs82y7iQOscr-7g@mail.gmail.com>
 <CABfF9mNfU=swmpVXfVr7pYWs72jrd-HDY8+_NXyBDAKa4CWG5Q@mail.gmail.com>
 <CAO-hwJ+i3zd=CyU0T+Nb1vGfZfenMBH16ern_ncTTKEpyGAuBA@mail.gmail.com>
 <CABfF9mNrMx2BzU5tbBeapY15M4Ls_5xYBGfVB=Up5TJu=eWCcg@mail.gmail.com>
 <CAO-hwJJGAWkhZgGeLBruqCoskY5PBP-STs4kh-P6fBvpuSgpUw@mail.gmail.com>
 <CABfF9mO3SQZvkQGOC09H5s7EEd2UGhpE=GYB46g_zF3aEOVn=Q@mail.gmail.com>
 <CABfF9mNbpTdAnChkZNKFed6C7n=Hyq-69rMUeDENE8ptLjJMSw@mail.gmail.com>
 <CAO-hwJ+PysPKFG=a9+L8vwhiw4uY3F3DZmg4FwgPWGZ7LPt4EA@mail.gmail.com> <2a20d7d1-55df-4861-5cf1-dee19536ed5@9300>
In-Reply-To: <2a20d7d1-55df-4861-5cf1-dee19536ed5@9300>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 10 Nov 2022 14:39:08 +0100
Message-ID: <CAO-hwJJDE-8TL2MbTX2xX3RfKEeh8H5h24UkcZJJhH5ptdpRaQ@mail.gmail.com>
Subject: Re: Litra Glow on Linux
To:     Andreas Bergmeier <abergmeier@gmx.net>
Cc:     linux-input@vger.kernel.org,
        USB mailing list <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jiri Kosina <jikos@kernel.org>, linux-leds@vger.kernel.org,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Nov 10, 2022 at 1:24 PM Andreas Bergmeier <abergmeier@gmx.net> wrote:
>
>
>
> On Thu, 10 Nov 2022, Benjamin Tissoires wrote:
>
> > On Thu, Nov 10, 2022 at 4:29 AM Andreas Bergmeier <abergmeier@gmx.net> wrote:
> > >
> > > On Wed, 9 Nov 2022 at 21:27, Andreas Bergmeier <abergmeier@gmx.net> wrote:
> > > >
> > > > Finally I have an environment where I can test my kernel code.
> > > >
> > > > On Mon, 31 Oct 2022 at 10:29, Benjamin Tissoires
> > > > <benjamin.tissoires@redhat.com> wrote:
> > > > > For identifying the GLOW device you should be adding an id in the
> > > > > table of hid-logitech-hidpp, with a driver data that tells the driver
> > > > > to look for 0x1990.
> > > > >
> > > > > >
> > > > > > > - you need to add a hook in connect_event to register the led class
> > > > > > > device that will hook on to the actual LED of the device
> > > > Sadly my tests did not go very far. The code fails already when
> > > > calling the `probe` callback (`hidpp_probe`).
> > > > When it calls into `hidpp_root_get_protocol_version` it seems to
> > > > receive `HIDPP_ERROR_RESOURCE_ERROR`.
> > > > Which then leads to an error message: Device not connected
> > > > Upon looking at `HIDPP_ERROR_RESOURCE_ERROR` (9) there is no
> > > > documentation what it means in code.
> > > > From a look into the docs it says that 9 is UNSUPPORTED error for 2.0
> > > > devices. Thus I am wondering how the code knows
> > > > that it is a problem with connectivity.
> >
> > From the top of my memory, this was told to us that this is the way we
> > detect if the device was connected or not in the unifying case. Though
> > in your case, it's a USB device, so there is no such thing as "not
> > connected"...
> So isn't the current error handling at a minimum misleading?
>

Maybe, but this is the first time we have that error on a non wireless
device... so it is not for the supported devices :)

>
> > > > Couldn't it also mean that the
> > > > device is not supporting getting the protocol version?
> >
> > Probably. What happens if you comment out that protocol version
> > request and force connected to be true?
> Well I went the other way around. I had a look at the hidpp utility
> sources:
> https://github.com/cvuchener/hidpp/blob/057407fbb7248bbc6cefcfaa860758d0711c01b9/src/libhidpp/hidpp/Device.cpp#L82
> Which seems to do a similar thing. From the top of my head the only
> difference seems to be that they are sending `0x1` as a ping value instead
> of `0x5a`. Might give that a shot next.
> Anyway hidpp-list-features successfully reads the protocol version in
> userspace (4, 2) as seen here:
> https://github.com/abergmeier/litra_glow_linux/blob/main/hidpp-list-features

Hmm... It would seem wrong for me if the firmware suddenly expects to
have a specific ping value.
If it works in userspace, it might also mean that the timing is not
right and we are talking to the device too early, and it can't answer
yet.

>
> > In your case though, it would be interesting to know if we should
> > bypass that verification.
> Since reading the protocol version seems generally possible I think we
> should understand what logitech-hidpp does wrong first.
>
>
> > > Also, looking into `supported_reports` turned out to be 2 (very long).
> >
> > Oops, you mistook the bit definition with the value:
> > #define HIDPP_REPORT_SHORT_SUPPORTED  BIT(0)  -> value of 1
> > #define HIDPP_REPORT_LONG_SUPPORTED  BIT(1)  -> value of 2
> > #define HIDPP_REPORT_VERY_LONG_SUPPORTED  BIT(2)  -> value of 4
> Ah indeed, thx.
>
> > And this is expected because you don't have VERY_LONG support on your device.
> True. The question remains whether the upgrade from LONG to VERY_LONG
> could be needed should a device only support VERY_LONG.
>

I don't think we want that. AFAICT, devices supporting VERY_LONG are
not very common, and also the length of the report makes it not
convenient for the generic protocol to be used there. I am not in the
head of Logitech's engineers, but removing the 20 bytes long report in
favor of 64 bytes long seems a little bit overkill (the 7 bytes long
is a different story).

And given that we generally add manual support of new devices, I think
we are safe not implementing something we haven't seen in the wild.

Cheers,
Benjamin

